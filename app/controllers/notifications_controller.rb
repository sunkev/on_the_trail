class NotificationsController < ApplicationController
  geocode_ip_address

  def new
    @notification = Notification.new

    geo_location = session[:geo_location]

    @lat, @lng = nil, nil

    if geo_location && geo_location.kind_of?(Hash)
      @lat = geo_location['lat'].round(3)
      @lng = geo_location['lng'].round(3)
    elsif geo_location.kind_of? Geokit::GeoLoc
      @lat = geo_location.lat.round(3)
      @lng = geo_location.lng.round(3)
    end
  end

  def create
    @notification = Notification.new(notification_params)

    if @notification.valid?
      @notification.save
      mailer = NotificationMailer
      mailer.send_notification(@notification.id).deliver_now
      mailer.send_sms(@notification.id).deliver_now

      flash[:notice] = 'Notification was sent!'
    else
      flash[:alert] = 'Notification errored!'
    end
    redirect_to action: 'new'
  end

  private

  def notification_params
    params.require(:notification).permit(:first_name, :last_name,
      :email, :phone, :contact_email, :message, :latitude, :longitude, :contact_phone, :carrier)
  end
end

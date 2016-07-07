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

    @carrier_collection = [
      {label: 'AT&T',           value: '@txt.att.net'},
      {label: 'Boost Mobile',   value: '@myboostmobile.com'},
      {label: 'Sprint',         value: '@messaging.sprintpcs.com'},
      {label: 'T-Mobile',       value: '@tmomail.net'},
      {label: 'US Cellular',    value: '@email.uscc.net'},
      {label: 'Verizon',        value: '@vtext.com'},
      {label: 'Virgin Mobile',  value: '@vmobl.com'},
    ]
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

require 'geokit'
require 'geokit-rails'

class NotificationsController < ApplicationController
  geocode_ip_address

  def new
    @notification = Notification.new

    geo_location = session[:geo_location]

    @lat, @lng = nil, nil

    if geo_location
      @lat = geo_location.lat.round(3)
      @lng = geo_location.lng.round(3)
    end
  end

  def create
    @notification = Notification.new(notification_params)

    if @notification.valid?
      @notification.save
      NotificationMailer.send_notification(@notification.id).deliver_now
      flash[:notice] = 'Notification was sent!'

      redirect_to action: 'new'
    else
      flash[:alert] = 'Notification errored!'
      redirect_to action: 'new'
    end
  end

  private

  def notification_params
    params.require(:notification).permit(:first_name, :last_name,
      :email, :phone, :contact_email, :message, :latitude, :longitude)
  end
end

class NotificationsController < ApplicationController
  def new
    @notification = Notification.new
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
      :email, :phone, :contact_email, :message)
  end
end
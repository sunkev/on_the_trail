class NotificationMailer < ActionMailer::Base
  default from: 'no-replay@not_spam.com'

  def send_notification(notification_id)
    @notification = Notification.find(notification_id)

    mail(to: @notification.contact_email, subject: "#{@notification.first_name} is in trouble!")
  end
end

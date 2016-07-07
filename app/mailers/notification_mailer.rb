class NotificationMailer < ActionMailer::Base
  default from: 'no-reply@not_spam.com'

  def send_notification(notification_id)
    @notification = Notification.find(notification_id)

    mail(to: @notification.contact_email, subject: "#{@notification.first_name} is in trouble!")
  end

  def send_sms(notification_id)
    @notification = Notification.find(notification_id)

    mail(to: "#{@notification.contact_phone}#{@notification.carrier}", subject: "") do |format|
      format.text { render text: @notification.message }
    end
  end
end

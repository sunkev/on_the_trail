class NotificationJob < ActiveJob::Base
  queue_as :default

  def perform(notification_id)
    mailer = NotificationMailer
    mailer.send_notification(notification_id).deliver_now
    mailer.send_sms(notification_id).deliver_now
  end
end

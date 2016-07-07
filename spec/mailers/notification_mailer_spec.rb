require 'spec_helper'

describe NotificationMailer do
  describe 'Sends an email to a given person' do
    it "when a user's account becomes locked out" do
      notification = create(:notification)

      NotificationMailer.send_notification(notification.id).deliver_now
      mail = ActionMailer::Base.deliveries.last
      assert_equal 'no-reply@not_spam.com', mail['from'].to_s
      assert_equal "#{notification.first_name} is in trouble!", mail['subject'].to_s
      expect(ActionMailer::Base.deliveries).to_not eql([])
    end
  end

  describe 'Sends an email to a carrier' do
    it "when a user's account becomes locked out" do
      notification = create(:notification)

      NotificationMailer.send_sms(notification.id).deliver_now
      mail = ActionMailer::Base.deliveries.last
      assert_equal 'no-reply@not_spam.com', mail['from'].to_s
      assert_equal "#{notification.contact_phone}#{notification.carrier}", mail['to'].to_s

      expect(ActionMailer::Base.deliveries).to_not eql([])
    end
  end
end

class AddNotificationDateToNotification < ActiveRecord::Migration
  def change
    add_column :notifications, :notification_date, :datetime
  end
end

class AddCarrierToNotification < ActiveRecord::Migration
  def change
    Notification.destroy_all
    add_column :notifications, :contact_phone, :string, null: false
    add_column :notifications, :carrier, :string, null: false
  end
end

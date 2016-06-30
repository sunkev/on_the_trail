class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email
      t.string :phone
      t.text   :message, null: false
      t.string :contact_email, null: false
    end
  end
end

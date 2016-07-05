class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email
      t.string :phone
      t.text   :message, null: false
      t.string :contact_email, null: false
      t.float :latitude
      t.float :longitude
    end
  end
end

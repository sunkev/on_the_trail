class Notification < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :message, presence: true
  validates :contact_email, presence: true

  #validates valid phone with regex
  #validates valid email with regex
end
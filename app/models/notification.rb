
class Notification < ActiveRecord::Base
  acts_as_mappable :lat_column_name => :latitude,
                   :lng_column_name => :longitude
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :message, presence: true
  validates :contact_email, email: true, presence: true

  #validates valid phone with regex
  #validates valid email with regex
end

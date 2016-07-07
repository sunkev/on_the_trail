class Notification < ActiveRecord::Base
  acts_as_mappable :lat_column_name => :latitude,
                   :lng_column_name => :longitude

  CARRIERS = [
    {label: 'AT&T',           value: '@txt.att.net'},
    {label: 'Boost Mobile',   value: '@myboostmobile.com'},
    {label: 'Sprint',         value: '@messaging.sprintpcs.com'},
    {label: 'T-Mobile',       value: '@tmomail.net'},
    {label: 'US Cellular',    value: '@email.uscc.net'},
    {label: 'Verizon',        value: '@vtext.com'},
    {label: 'Virgin Mobile',  value: '@vmobl.com'},
  ]

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :message, presence: true
  validates :contact_email, email: true, presence: true
  validates :contact_phone, presence: true
  validates :carrier, presence: true
  validates :carrier, inclusion: {in: CARRIERS.map{|c|c[:value]}}
end

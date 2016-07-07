FactoryGirl.define do
  factory :notification do
    first_name 'John'
    last_name 'smith'
    contact_email 'john@john.com'
    message 'AHhh!'
    latitude 30
    longitude 45
    carrier '@myboostmobile.com'
    contact_phone '9789789789'
  end
end

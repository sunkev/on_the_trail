FactoryGirl.define do
  factory :user do
    first_name 'Sue'
    sequence(:last_name) { |i| "Sella the #{i.ordinalize}" }
    sequence(:email) { |i| "email#{i.ordinalize}@faking.com" }
    password 'Password1'
    phone '9789789789'
  end
end

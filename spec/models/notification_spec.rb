require 'spec_helper'

describe Notification do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:contact_email) }
  it { should validate_presence_of(:message) }

  it 'has a first name' do
    first_name = 'John'
    notification = create(:notification, first_name: first_name)
    expect(notification.first_name).to eql first_name
  end

  it 'has a last name' do
    last_name = 'smith'
    notification = create(:notification, last_name: last_name)
    expect(notification.last_name).to eql last_name
  end

  it 'has a contact email' do
    contact_email = 'john@john.com'
    notification = create(:notification, contact_email: contact_email)
    expect(notification.contact_email).to eql contact_email
  end

  it 'has a message' do
    message = 'AHhh!'
    notification = create(:notification, message: message)
    expect(notification.message).to eql message
  end

  it 'has a latitude' do
    latitude = 30.0
    notification = create(:notification, latitude: latitude)
    expect(notification.latitude).to eql latitude
  end

  it 'has a longitude' do
    longitude = 45.0
    notification = create(:notification, longitude: longitude)
    expect(notification.longitude).to eql longitude
  end

  it 'has a contact phone number' do
    contact_phone = '9789789789'
    notification = create(:notification, contact_phone: contact_phone)
    expect(notification.contact_phone).to eql contact_phone
  end

  it 'has a carrier' do
    carrier = '@myboostmobile.com'
    notification = create(:notification, carrier: carrier)
    expect(notification.carrier).to eql carrier
  end

  it 'does not accept fake carriers' do
    carrier = '@windowcleaner.com'
    notification = build(:notification, carrier: carrier)
    expect(notification.valid?).to eql false
  end
end
require 'spec_helper'

describe Notification do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:contact_email) }
  it { should validate_presence_of(:message) }

  let(:notification) { Notification.create(first_name: 'John', last_name: 'smith',
    contact_email: 'john@john.com', message: 'AHhh!', latitude: 30, longitude: 45,
    carrier: '@myboostmobile.com', contact_phone: '9789789789')}

  it 'has a first name' do
    expect(notification.first_name).to eql 'John'
  end

  it 'has a last name' do
    expect(notification.last_name).to eql 'smith'
  end

  it 'has a contact email' do
    expect(notification.contact_email).to eql 'john@john.com'
  end

  it 'has a message' do
    expect(notification.message).to eql 'AHhh!'
  end

  it 'has a latitude' do
    expect(notification.latitude).to eql 30.0
  end

  it 'has a longitude' do
    expect(notification.longitude).to eql 45.0
  end

  it 'has a contact phone number' do
    expect(notification.contact_phone).to eql '9789789789'
  end

  it 'has a carrier' do
    expect(notification.carrier).to eql '@myboostmobile.com'
  end
end
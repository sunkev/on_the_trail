require 'spec_helper'

describe Notification do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:contact_email) }
  it { should validate_presence_of(:message) }

  it 'has different attributes' do
    notification = Notification.create(first_name: 'John', last_name: 'smith',
      contact_email: 'john@john.com', message: 'AHhh!')

    expect(notification.first_name).to eql 'John'
    expect(notification.last_name).to eql 'smith'
    expect(notification.contact_email).to eql 'john@john.com'
    expect(notification.message).to eql 'AHhh!'
  end
end
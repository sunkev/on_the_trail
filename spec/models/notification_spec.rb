require 'spec_helper'

describe Notification do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:contact_email) }
  it { should validate_presence_of(:message) }
end
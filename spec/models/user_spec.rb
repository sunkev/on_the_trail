require 'spec_helper'

describe User do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }

  it { should validate_presence_of(:email) }

  it 'should validate uniqueness of email' do
    User.create(first_name: 'Factory', last_name: 'Girl', email: 'helpful@gmail.com', password: 123456)
    duplicate_email_user = User.create(first_name: 'Not', last_name: 'Boy', email: 'helpful@gmail.com', password: 123456)

    expect(duplicate_email_user.valid?).to eql false
  end

  it 'only creates with a valid email' do
    valid_user = User.new(first_name: 'Factory', last_name: 'Girl', email: 'helpful@gmail.com', password: 123456)
    invalid_user = User.new(first_name: 'Factory', last_name: 'Girl', email: 'casdfasd', password: 123456)

    expect(valid_user.valid?).to eql true
    expect(invalid_user.valid?).to eql false
  end
end
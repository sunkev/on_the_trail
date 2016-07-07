require 'spec_helper'

describe User do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }

  it 'should validate uniqueness of email' do
    first_user = create(:user, first_name: 'Factory', email: 'helpful@gmail.com')
    duplicate_email_user = build(:user, first_name: 'Girl', email: 'helpful@gmail.com')

    expect(duplicate_email_user.valid?).to eql false
  end

  it 'only creates with a valid email' do
    valid_user = build(:user, first_name: 'Factory', email: 'helpful@gmail.com')
    invalid_user = build(:user, first_name: 'Girl', email: 'casdfasd')

    expect(valid_user.valid?).to eql true
    expect(invalid_user.valid?).to eql false
  end
end
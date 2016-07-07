require 'spec_helper'

feature 'user visits page to send notification' do
  specify 'user fills out a valid form' do
    user = User.create(first_name: 'Factory', last_name: 'Girl', email: 'helpful@gmail.com', password: 123456)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    fill_in 'First name', with: 'Trac'
    fill_in 'Last name', with: 'Shi'
    fill_in 'Phone', with: '1234567890'
    fill_in 'Email', with: 'fake@notreal.com'
    fill_in 'Contact email', with: 'mom@notreal.com'
    fill_in 'Message', with: 'Nothing is going wrong?'
    select 'Verizon', from: 'Carrier'
    fill_in 'Contact phone', with: '9789789789'

    click_on 'Create Notification'

    expect(page).to have_content 'Notification was sent!'
  end
end
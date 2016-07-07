require 'spec_helper'

feature 'on the user profile page' do
  specify 'user can edit name, email' do
    user = create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    click_on 'Edit Profile'

    fill_in 'Email', with: 'an+email@email.com'
    fill_in 'First name', with: 'Tony'
    fill_in 'Last name', with: 'Stark'
    fill_in 'Current password', with: user.password

    click_on 'Update'

    expect(page).to have_content 'Tony'
  end
end
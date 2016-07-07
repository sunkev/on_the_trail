require 'spec_helper'

feature 'user signs up' do
  specify 'user makes a valid account' do
    visit '/'
    click_on 'Sign up'

    fill_in 'Email', with: 'an+email@email.com'
    fill_in 'First name', with: 'Tony'
    fill_in 'Last name', with: 'Stark'
    fill_in 'Phone', with: '1234567890'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'

    click_button 'Sign up'

    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end
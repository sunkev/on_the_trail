require 'spec_helper'

feature 'user visits page to send notification' do
  specify 'user fills out a valid form' do
    visit '/'

    fill_in 'First name', with: 'Trac'
    fill_in 'Last name', with: 'Shi'
    fill_in 'Phone', with: '1234567890'
    fill_in 'Email', with: 'fake@not_real.com'
    fill_in 'Contact email', with: 'mom@not_real.com'
    fill_in 'Message', with: 'Nothing is going wrong?'

    click_on 'Create Notification'

    expect(page).to have_content 'Notification was sent!'
  end
end
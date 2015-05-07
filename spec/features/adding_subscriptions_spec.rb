require 'rails_helper'

RSpec.describe 'Creating a subscription', js: true do
  it 'informs the user when they have been successful.' do
    visit '/'

    within('.subscription-form') do
      fill_in 'Email address', with: FactoryGirl.generate(:email)
      click_button 'Subscribe'
    end

    expect(page).to have_css('.alert-success')
    expect(page).to have_content('Subscription Successful')
  end
end

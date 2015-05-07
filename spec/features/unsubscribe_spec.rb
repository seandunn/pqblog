require 'rails_helper'

RSpec.feature 'Following an unsubscribe link' do
  it 'leads to the unsubscribe page' do
    subscription = Subscription.create(email: 'test_email@example.com')

    page.driver.submit :delete, "/subscriptions/#{subscription.id}", {}

    expect(page).to have_content('Successfully unsubscribed from Small Blog')
  end
end

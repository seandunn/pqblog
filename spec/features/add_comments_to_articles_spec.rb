require 'rails_helper'

RSpec.feature "Commenting on an Article's page" do
  it 'displays the new comment screen name and body' do
    article = FactoryGirl.create(:article)
    visit article_path(article)

    within('form.new_comment') do
      fill_in 'Screen Name', with: 'TEST_NAME'
      fill_in 'Comment', with: 'TEST_COMMENT_TEXT'
    end

    click_button('Save Comment')

    expect(page).to have_content('TEST_NAME')
    expect(page).to have_content('TEST_COMMENT_TEXT')
  end
end

require 'rails_helper'

feature 'Article creation' do
  it 'informs the user of success' do
    visit '/admin/articles/new'

    fill_in 'Title', with: 'TITLE_TEST_SUCCESS_VALUE'

    fill_in 'Body', with: 'BODY_TEST_SUCCESS_VALUE'
    click_button 'Save Article'

    expect(page).to have_css '.alert-success', 'Article successfully saved.'
  end

  it 'validates that the article has a title' do
    visit '/admin/articles/new'

    fill_in 'Body', with: 'TEST_BODY_PRESENT_TITLE_MISSING'

    click_button 'Save Article'

    expect(page).to have_css '.alert-danger'
    expect(page).to have_content("Title can't be blank")
  end

  it 'validates that the article has a body' do
    visit '/admin/articles/new'

    fill_in 'Title', with: 'TEST_TITLE_PRESENT_BODY_MISSING'

    click_button 'Save Article'

    expect(page).to have_css '.alert-danger'
    expect(page).to have_content("Body can't be blank")
  end
end

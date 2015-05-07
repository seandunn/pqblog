require 'rails_helper'

RSpec.describe Comment do
  it 'is invalid without a screen_name' do
    article = FactoryGirl.create(:article)
    comment = article.comments.new(body: 'TEST_COMMENT_BODY')
    comment.valid?
    expect(comment.errors[:screen_name]).to include("can't be blank")
  end

  it 'is invalid without a body' do
    article = FactoryGirl.create(:article)
    comment = article.comments.new(screen_name: 'TEST_COMMENT_SCREEN_NAME')
    comment.valid?
    expect(comment.errors[:body]).to include("can't be blank")
  end

  it 'is invalid without an associated article' do
    comment = Comment.new(
      screen_name: 'TEST_COMMENT_SCREEN_NAME',
      body: 'TEST_COMMENT_BODY')

    expect(comment.valid?).to be false
  end

  it 'is valid with a screen_name and body' do
    article = FactoryGirl.create(:article)
    comment = article.comments.new(
      screen_name: 'TEST_COMMENT_SCREEN_NAME',
      body: 'TEST_COMMENT_BODY')

    expect(comment.valid?).to be true
  end
end

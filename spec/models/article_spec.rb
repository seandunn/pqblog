require 'rails_helper'

describe Article do
  it 'is invalid without a title' do
    article = Article.new(body: 'TEST_BODY')
    article.valid?
    expect(article.errors[:title]).to include("can't be blank")
  end

  it 'is invalid without a body' do
    article = Article.new(title: 'TEST_TITLE')
    article.valid?
    expect(article.errors[:body]).to include("can't be blank")
  end

  it 'is valid with title and body' do
    article = Article.new(title: 'TEST_TITLE', body: 'TEST_BODY')
    expect(article.valid?).to be true
  end
end

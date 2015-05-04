require 'rails_helper'

RSpec.describe ArticleListener do
  before(:each) do
    @subscription = Subscription.create(email: 'TEST_EMAIL')

    @article = Article.new(
      title: 'TEST_ARTICLE_LISTENER',
      body:'TEST_ARTICLE_LISTENER')
  end

  it "sends update emails" do
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end

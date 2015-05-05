require 'rails_helper'

RSpec.describe ArticleEmailJob, :job do
  before(:each) do
    @subscription = Subscription.create(email: 'test_email@example.com')
  end

  it "sends update emails" do
    @article = Article.create(
      title: 'TEST_ARTICLE_LISTENER',
      body:'TEST_ARTICLE_LISTENER')

    expect(Article.count).to eq(1)
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end

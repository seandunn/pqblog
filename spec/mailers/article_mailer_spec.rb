require 'rails_helper'

RSpec.describe ArticleMailer do
  let(:subscription) { Subscription.create(email: 'test_email@example.com') }

  let(:article) {
    Article.create( title: 'TEST_ARTICLE_LISTENER', body:'TEST_ARTICLE_LISTENER')
  }

  let(:mail) { ArticleMailer.article_updated(subscription, article) }

  it 'renders the receiver email' do
    expect(mail.to).to eql([subscription.email])
  end


  it 'renders the sender email' do
    expect(mail.from).to eql(['smallblog@example.com'])
  end

  it 'assigns @email' do
    expect(mail.body.encoded).to match(subscription.email)
  end

  it 'includes an unsubscribe link' do
    expect(mail.body.encoded).to include(
      "http://localhost:3000/subscriptions/#{subscription.id}"
    )
  end
end

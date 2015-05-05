require 'rails_helper'

RSpec.describe Admin::ArticlesController, type: :controller do

  describe 'POST create' do
    it 'sends email to subscribers after creation' do
      @subscription = Subscription.create(email: 'test_email@example.com')
      post :create, article: {
        title: 'TEST_ARTICLE_LISTENER',
        body:'TEST_ARTICLE_LISTENER'
      }
    end
  end
end

require 'rails_helper'

RSpec.describe SubscriptionsController, type: :controller do
  describe 'POST create' do
    it 'has a 200 status code' do
      xhr :post, :create, subscription: {email: 'foo@example.com'}
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE destroy' do
    before(:each) do
      @subscription = Subscription.create(email: 'test@example.com')
    end

    it 'should remove the subscription' do
      expect { delete :destroy, id: @subscription.id }.to change(Subscription, :count)
    end
  end


end

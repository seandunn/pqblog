
require 'rails_helper'

RSpec.describe Subscription do
  it 'is invalid without an email' do
    subscription = Subscription.new
    subscription.valid?
    expect(subscription.errors[:email]).to include("can't be blank")
  end

  it 'is invalid without a valid email address' do
    subscription = Subscription.new(email: 'foobar')
    subscription.valid?
    expect(subscription.errors[:email]).to include("is not an email")
  end

  it 'is valid with a valid email' do
    subscription = Subscription.new(email: 'foobar@example.com')
    expect(subscription.valid?).to be true
  end
end

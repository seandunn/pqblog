FactoryGirl.define do
  factory :article do
    title 'TEST_TITLE'
    body  'TEST_BODY'
  end

  sequence :email do 
    # Using a normal sequence fails non-db:prepared runs e.g. under guard.
    "test#{Time.now.to_i}@example.com"
  end
end


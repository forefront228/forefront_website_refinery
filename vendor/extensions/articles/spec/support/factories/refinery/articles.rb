
FactoryGirl.define do
  factory :article, :class => Refinery::Articles::Article do
    sequence(:submitted_url) { |n| "refinery#{n}" }
  end
end


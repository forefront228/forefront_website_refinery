
FactoryGirl.define do
  factory :custom_page, :class => Refinery::CustomPages::CustomPage do
    sequence(:name) { |n| "refinery#{n}" }
  end
end


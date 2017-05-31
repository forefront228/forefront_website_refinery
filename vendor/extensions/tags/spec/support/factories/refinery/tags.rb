
FactoryGirl.define do
  factory :tag, :class => Refinery::Tags::Tag do
    sequence(:name) { |n| "refinery#{n}" }
  end
end


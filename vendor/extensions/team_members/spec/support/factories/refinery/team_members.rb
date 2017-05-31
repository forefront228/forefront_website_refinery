
FactoryGirl.define do
  factory :team_member, :class => Refinery::TeamMembers::TeamMember do
    sequence(:first_name) { |n| "refinery#{n}" }
  end
end


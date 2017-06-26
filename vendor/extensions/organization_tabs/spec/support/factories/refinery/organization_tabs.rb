
FactoryGirl.define do
  factory :organization_tab, :class => Refinery::OrganizationTabs::OrganizationTab do
    sequence(:tab_name) { |n| "refinery#{n}" }
  end
end


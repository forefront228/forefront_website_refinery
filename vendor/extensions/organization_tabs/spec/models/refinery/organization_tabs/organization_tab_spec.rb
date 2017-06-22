require 'spec_helper'

module Refinery
  module OrganizationTabs
    describe OrganizationTab do
      describe "validations", type: :model do
        subject do
          FactoryGirl.create(:organization_tab,
          :tab_name => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:tab_name) { should == "Refinery CMS" }
      end
    end
  end
end

require 'spec_helper'

module Refinery
  module CustomPages
    describe CustomPage do
      describe "validations", type: :model do
        subject do
          FactoryGirl.create(:custom_page,
          :name => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:name) { should == "Refinery CMS" }
      end
    end
  end
end

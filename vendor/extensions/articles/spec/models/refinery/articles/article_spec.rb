require 'spec_helper'

module Refinery
  module Articles
    describe Article do
      describe "validations", type: :model do
        subject do
          FactoryGirl.create(:article,
          :submitted_url => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:submitted_url) { should == "Refinery CMS" }
      end
    end
  end
end

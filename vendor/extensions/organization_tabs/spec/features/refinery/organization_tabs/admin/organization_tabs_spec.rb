# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "OrganizationTabs" do
    describe "Admin" do
      describe "organization_tabs", type: :feature do
        refinery_login

        describe "organization_tabs list" do
          before do
            FactoryGirl.create(:organization_tab, :tab_name => "UniqueTitleOne")
            FactoryGirl.create(:organization_tab, :tab_name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.organization_tabs_admin_organization_tabs_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.organization_tabs_admin_organization_tabs_path

            click_link "Add New Organization Tab"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Tab Name", :with => "This is a test of the first string field"
              expect { click_button "Save" }.to change(Refinery::OrganizationTabs::OrganizationTab, :count).from(0).to(1)

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
            end
          end

          context "invalid data" do
            it "should fail" do
              expect { click_button "Save" }.not_to change(Refinery::OrganizationTabs::OrganizationTab, :count)

              expect(page).to have_content("Tab Name can't be blank")
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:organization_tab, :tab_name => "UniqueTitle") }

            it "should fail" do
              visit refinery.organization_tabs_admin_organization_tabs_path

              click_link "Add New Organization Tab"

              fill_in "Tab Name", :with => "UniqueTitle"
              expect { click_button "Save" }.not_to change(Refinery::OrganizationTabs::OrganizationTab, :count)

              expect(page).to have_content("There were problems")
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:organization_tab, :tab_name => "A tab_name") }

          it "should succeed" do
            visit refinery.organization_tabs_admin_organization_tabs_path

            within ".actions" do
              click_link "Edit this organization tab"
            end

            fill_in "Tab Name", :with => "A different tab_name"
            click_button "Save"

            expect(page).to have_content("'A different tab_name' was successfully updated.")
            expect(page).not_to have_content("A tab_name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:organization_tab, :tab_name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.organization_tabs_admin_organization_tabs_path

            click_link "Remove this organization tab forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::OrganizationTabs::OrganizationTab.count).to eq(0)
          end
        end

      end
    end
  end
end

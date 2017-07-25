# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "CustomPages" do
    describe "Admin" do
      describe "custom_pages", type: :feature do
        refinery_login

        describe "custom_pages list" do
          before do
            FactoryGirl.create(:custom_page, :name => "UniqueTitleOne")
            FactoryGirl.create(:custom_page, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.custom_pages_admin_custom_pages_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.custom_pages_admin_custom_pages_path

            click_link "Add New Custom Page"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              expect { click_button "Save" }.to change(Refinery::CustomPages::CustomPage, :count).from(0).to(1)

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
            end
          end

          context "invalid data" do
            it "should fail" do
              expect { click_button "Save" }.not_to change(Refinery::CustomPages::CustomPage, :count)

              expect(page).to have_content("Name can't be blank")
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:custom_page, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.custom_pages_admin_custom_pages_path

              click_link "Add New Custom Page"

              fill_in "Name", :with => "UniqueTitle"
              expect { click_button "Save" }.not_to change(Refinery::CustomPages::CustomPage, :count)

              expect(page).to have_content("There were problems")
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:custom_page, :name => "A name") }

          it "should succeed" do
            visit refinery.custom_pages_admin_custom_pages_path

            within ".actions" do
              click_link "Edit this custom page"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            expect(page).to have_content("'A different name' was successfully updated.")
            expect(page).not_to have_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:custom_page, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.custom_pages_admin_custom_pages_path

            click_link "Remove this custom page forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::CustomPages::CustomPage.count).to eq(0)
          end
        end

      end
    end
  end
end

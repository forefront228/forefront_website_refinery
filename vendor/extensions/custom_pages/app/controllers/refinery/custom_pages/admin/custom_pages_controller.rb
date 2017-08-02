module Refinery
  module CustomPages
    module Admin
      class CustomPagesController < ::Refinery::AdminController

        crudify :'refinery/custom_pages/custom_page',
                :title_attribute => 'name'

        def update
          @custom_page.assign_attributes(custom_page_params)
          if custom_page_params[:hero_image_id]==""
            previous_hero_image = Refinery::CustomPages::CustomPage.find_by_id(params[:id]).hero_image_id
            @custom_page.assign_attributes(hero_image_id: previous_hero_image)
          end
          
          if @custom_page.save
            flash.notice = t(
              'refinery.crudify.updated',
              :what => "'#{@custom_page.name}'"
            )

            create_or_update_successful
          else
            create_or_update_unsuccessful 'edit'
          end
        end

        private

        # Only allow a trusted parameter "white list" through.
        def custom_page_params
          params.require(:custom_page).permit(:name, :hero_image_id, :hero_banner_text, :body, :body_header, :address_line_1, :address_line_2, :city_state_zip, :phone_number, :email_address, :map_embed)
        end
      end
    end
  end
end

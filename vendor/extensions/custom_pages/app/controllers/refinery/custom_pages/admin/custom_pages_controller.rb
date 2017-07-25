module Refinery
  module CustomPages
    module Admin
      class CustomPagesController < ::Refinery::AdminController

        crudify :'refinery/custom_pages/custom_page',
                :title_attribute => 'name'

        private

        # Only allow a trusted parameter "white list" through.
        def custom_page_params
          params.require(:custom_page).permit(:name, :hero_image_id, :hero_banner_text, :body, :body_header, :address_line_1, :address_line_2, :city_state_zip, :phone_number, :email_address, :map_embed)
        end
      end
    end
  end
end

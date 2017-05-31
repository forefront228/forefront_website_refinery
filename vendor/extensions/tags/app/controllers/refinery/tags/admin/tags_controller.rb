module Refinery
  module Tags
    module Admin
      class TagsController < ::Refinery::AdminController

        crudify :'refinery/tags/tag',
                :title_attribute => 'name'

        private

        # Only allow a trusted parameter "white list" through.
        def tag_params
          params.require(:tag).permit(:name)
        end
      end
    end
  end
end

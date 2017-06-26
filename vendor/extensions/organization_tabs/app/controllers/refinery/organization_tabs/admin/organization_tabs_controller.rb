module Refinery
  module OrganizationTabs
    module Admin
      class OrganizationTabsController < ::Refinery::AdminController

        crudify :'refinery/organization_tabs/organization_tab',
                :title_attribute => 'tab_name'

        private

        # Only allow a trusted parameter "white list" through.
        def organization_tab_params
          params.require(:organization_tab).permit(:tab_name, :body)
        end
      end
    end
  end
end

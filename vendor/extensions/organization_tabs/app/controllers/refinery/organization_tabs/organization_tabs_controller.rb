module Refinery
  module OrganizationTabs
    class OrganizationTabsController < ::ApplicationController

      before_action :find_all_organization_tabs
      # before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @organization_tab in the line below:
        present(@page)
      end

      def show
        @organization_tab = OrganizationTab.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @organization_tab in the line below:
        present(@page)
      end

    protected

      def find_all_organization_tabs
        @organization_tabs = OrganizationTab.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/organization_tabs").first
      end

    end
  end
end

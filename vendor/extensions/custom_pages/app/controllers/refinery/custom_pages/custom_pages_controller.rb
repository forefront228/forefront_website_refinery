module Refinery
  module CustomPages
    class CustomPagesController < ::ApplicationController

      before_action :find_all_custom_pages
      # before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @custom_page in the line below:
        present(@page)
      end

      def show
        @custom_page = CustomPage.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @custom_page in the line below:
        present(@page)
      end

    protected

      def find_all_custom_pages
        @custom_pages = CustomPage.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/custom_pages").first
      end

    end
  end
end

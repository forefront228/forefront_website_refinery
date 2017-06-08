module Refinery
  module Articles
    class ArticlesController < ::ApplicationController

      before_action :find_all_articles
      before_action :find_page

      def index
        @articles = Article.order(created_at: :desc).limit(5)
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @article in the line below:
        present(@page)
      end

      def show
        @article = Article.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @article in the line below:
        present(@page)
      end

    protected

      def find_all_articles
        @articles = Article.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/articles").first
      end

    end
  end
end

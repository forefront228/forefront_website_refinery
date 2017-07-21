module Refinery
  module Articles
    class ArticlesController < ::ApplicationController

      before_action :find_all_articles
      before_action :find_page

      def index
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

      def load_more_news
        @num_of_new_articles = 3
        @articles = Article.where("position > ?", params[:article_position]).order(:position).take(@num_of_new_articles)
        puts @articles.inspect
        respond_to do |format|
          format.html
          format.json { render json: @resource }
          format.js
        end
      end

    protected

      def find_all_articles
        @articles = Article.order('position ASC').limit(3)
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/articles").first
      end

    end
  end
end

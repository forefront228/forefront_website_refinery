module Refinery
  module Articles
    class ArticlesController < ::ApplicationController

      before_action :find_all_articles
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @article in the line below:
        @news = Refinery::CustomPages::CustomPage.find_by_name("News")
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
        @all_articles = Article.order(:position)[params[:loaded_article_count].to_i .. -1]
        @last_article_id = @all_articles.last.id
        @new_articles = @all_articles.take(@num_of_new_articles)
        puts @new_articles.inspect
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

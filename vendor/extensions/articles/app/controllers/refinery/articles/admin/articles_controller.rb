module Refinery
  module Articles
    module Admin
      class ArticlesController < ::Refinery::AdminController

        crudify :'refinery/articles/article',
        :title_attribute => 'content'

        def callback
          code = params["code"]
          oauth = LinkedIn::OAuth2.new
          access_token = oauth.get_access_token(code)
          api = LinkedIn::API.new(access_token)

          p "**********************"
          p "API ACCESSED"
          p "**********************"

          linkedin_articles = api.company_updates(id: 3277007)["all"]

          # binding.pry

          # Article.destroy_all

          article_timestamps = Article.all.pluck(:created_at)

          linkedin_articles.each do |article|
            timestamp = DateTime.strptime(article["timestamp"].to_s, '%M')
            if article_timestamps.include?(timestamp)
              p "included already"
            else
              p "make a new article"
              Article.create(content: article['update_content']['company_status_update']['share']['comment'], submitted_url: article['update_content']['company_status_update']['share']['content']['submitted_url'])
            end
          end

          redirect_to(articles_admin_articles_path)
        end

        private

        # Only allow a trusted parameter "white list" through.
        def article_params
          params.require(:article).permit(:content, :submitted_url)
        end
      end
    end
  end
end

module Refinery
  module Articles
    module Admin
      class ArticlesController < ::Refinery::AdminController

        crudify :'refinery/articles/article',
        :title_attribute => 'content'

        def index
          search_all_articles if searching?
          # paginate_all_articles
          @articles = Article.all.order(:position)
          render_partial_response?
        end

        def callback
          code = params["code"]
          oauth = LinkedIn::OAuth2.new
          access_token = oauth.get_access_token(code)
          api = LinkedIn::API.new(access_token)

          p "**********************"
          p "API ACCESSED"
          p "**********************"

          linkedin_articles = api.company_updates(id: 3277007)["all"].sort_by { |a| a[:linkedin_timestamp]}

          # binding.pry

          # Article.destroy_all
          if Article.all.count != 0
            article_timestamps = Article.all.pluck(:linkedin_timestamp)
          else
            article_timestamps = []
          end

          linkedin_articles.each do |article|
            if article_timestamps.include?(article["timestamp"].to_s)
              p "*********************"
              p "included already"
              p "*********************"
            else
              submitted_url = article['update_content']['company_status_update']['share']['content']['submitted_url']
              thumbnailer = LinkThumbnailer.generate(submitted_url)
              p "*********************"
              p "make a new article"
              p "*********************"
              if thumbnailer.videos.count == 0 && thumbnailer.images.count == 0
                Article.create(content: article['update_content']['company_status_update']['share']['comment'], submitted_url: submitted_url, image_url: article['update_content']['company_status_update']['share']['content']["submitted_image_url"], shortened_url: article['update_content']['company_status_update']['share']['content']["shortened_url"], linkedin_timestamp: article['timestamp'].to_s)
              elsif thumbnailer.videos.count == 0
                Article.create(content: article['update_content']['company_status_update']['share']['comment'], submitted_url: submitted_url, image_url: article['update_content']['company_status_update']['share']['content']["submitted_image_url"], shortened_url: article['update_content']['company_status_update']['share']['content']['shortened_url'], linkedin_timestamp: article['timestamp'].to_s)
              else
                Article.create(content: article['update_content']['company_status_update']['share']['comment'], submitted_url: submitted_url, image_url: article['update_content']['company_status_update']['share']['content']['submitted_image_url'], video_embed: thumbnailer.videos[0].embed_code, shortened_url: article['update_content']['company_status_update']['share']['content']['shortened_url'], linkedin_timestamp: article['timestamp'].to_s)
              end
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

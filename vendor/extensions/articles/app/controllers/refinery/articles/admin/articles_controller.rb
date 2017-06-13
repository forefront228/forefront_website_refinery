module Refinery
  module Articles
    module Admin
      class ArticlesController < ::Refinery::AdminController

        crudify :'refinery/articles/article'

        def index
          @articles = Article.paginate(:page => params[:page])
        end

        def callback
          code = params["code"]
          oauth = LinkedIn::OAuth2.new
          access_token = oauth.get_access_token(code)
          api = LinkedIn::API.new(access_token)

          p "**********************"
          p "API ACCESSED"
          p "**********************"

          linkedin_articles = api.company_updates(id: 3277007)["all"]

          binding.pry


          linkedin_articles.each do |article|

          end



          redirect_to("/refinery/articles")
        end

        private

        # Only allow a trusted parameter "white list" through.
        def article_params
          params.require(:article).permit(:title, :text, :user_id)
        end
      end
    end
  end
end

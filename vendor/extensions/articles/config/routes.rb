Refinery::Core::Engine.routes.draw do

  # Frontend routes
resources :articles, path: '/news', controller: 'articles/articles', only: [:index,:show]
get '/load_more_news' => 'articles/articles#load_more_news', as: 'load_more_news'

  # Admin routes
  namespace :articles, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :articles, except: [:show, :new, :create] do
        collection do
          post :update_positions
        end
      end
    end
  end

end

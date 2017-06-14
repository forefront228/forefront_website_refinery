Refinery::Core::Engine.routes.draw do

  # Frontend routes
resources :articles, path: '/news', controller: 'articles/articles', only: [:index,:show]

  # Admin routes
  namespace :articles, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :articles, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end

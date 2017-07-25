Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :custom_pages do
    resources :custom_pages, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :custom_pages, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :custom_pages, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end

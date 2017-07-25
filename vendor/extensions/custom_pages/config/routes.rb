Refinery::Core::Engine.routes.draw do

  # Frontend routes

  # Admin routes
  namespace :custom_pages, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :custom_pages, :except => [:show,:create,:new,:destroy] do
        collection do
          post :update_positions
        end
      end
    end
  end

end

Refinery::Core::Engine.routes.draw do

  # Frontend routes


  # Admin routes
  namespace :organization_tabs, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :organization_tabs, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end

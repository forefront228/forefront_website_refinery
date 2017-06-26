Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :organization_tabs do
    resources :organization_tabs, :path => '', :only => [:index, :show]
  end

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

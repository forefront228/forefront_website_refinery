Refinery::Core::Engine.routes.draw do

  # Frontend routes
  # namespace :team_members do
  #   resources :team_members, :path => '', :only => [:index, :show]
  # end

resources :team_members, path: '/team', controller: 'team_members/team_members', only: [:index,:show]

  # Admin routes
  namespace :team_members, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :team_members, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end

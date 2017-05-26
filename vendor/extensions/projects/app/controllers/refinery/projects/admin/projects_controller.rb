module Refinery
  module Projects
    module Admin
      class ProjectsController < ::Refinery::AdminController

        crudify :'refinery/projects/project',
                :title_attribute => 'name'

        def project_params
          params.require(:project).permit(permitted_project_params)
        end

        # Only allow a trusted parameter "white list" through.
        def permitted_project_params
          [:name, :description, :picture_id, :team_name, :location, :area, :completion_date, :featured, :category_id, :featured_image]
        end


# Below was the initial file configuration. Changed for the purpose of implementing image collections for Project
        # private
        #
        # # Only allow a trusted parameter "white list" through.
        # def project_params
        #   params.require(:project).permit(:name, :description, :picture_id, :team_name, :location, :area, :completion_date, :featured, :category_id)
        # end
      end
    end
  end
end

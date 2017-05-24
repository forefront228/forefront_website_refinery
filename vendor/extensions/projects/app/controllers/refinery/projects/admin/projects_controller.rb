module Refinery
  module Projects
    module Admin
      class ProjectsController < ::Refinery::AdminController

        crudify :'refinery/projects/project',
                :title_attribute => 'name'

        private

        # Only allow a trusted parameter "white list" through.
        def project_params
          params.require(:project).permit(:name, :description, :picture_id, :team_name, :location, :area, :completion_date, :featured, :category_id)
        end
      end
    end
  end
end

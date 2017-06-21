module Refinery
  module Projects
    module Admin
      class ProjectsController < ::Refinery::AdminController
        before_filter :find_all_categories


        crudify :'refinery/projects/project',
        :title_attribute => 'name'

        def create
          if Refinery::Projects::Project.create(project_params).valid?
            flash.notice = t(
            'refinery.crudify.created',
            :what => "#{params["project"]["name"]}"
            )
            create_or_update_successful
          else
            create_or_update_unsuccessful 'new'
          end
        end

        def update
          @project = Refinery::Projects::Project.find_by(id: params[:id])

          @project.taggings.destroy_all

          tags = params["tags"]["ids"]

          tags.each do |id|
            @project.taggings.create(tag_id: id.to_i, project_id: @project.id)
          end

          if @project.update_attributes(project_params)
            flash.notice = t(
            'refinery.crudify.updated',
            :what => "#{@project.name}"
            )
            create_or_update_successful
          else
            create_or_update_unsuccessful 'edit'
          end
        end

        def new
          @project = Refinery::Projects::Project.new
          @tags = Refinery::Tags::Tag.all
        end

        def edit
          @project = Refinery::Projects::Project.find_by(id: params[:id])
          @tags = Refinery::Tags::Tag.all
        end

        def project_params
          params.require(:project).permit(permitted_project_params)
        end

        # Only allow a trusted parameter "white list" through.
        def permitted_project_params
          [:name, :description, :picture_id, :team_name, :location, :area, :completion_date, :featured, :category_id, :featured_image_id]
        end

        protected

        def find_all_categories
          @categories = Category.all
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

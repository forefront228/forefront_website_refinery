module Refinery
  module Projects
    module Admin
      class ProjectsController < ::Refinery::AdminController
        # before_filter :find_all_categories


        crudify :'refinery/projects/project',
        :title_attribute => 'name'

        def create
          @project = Refinery::Projects::Project.new(project_params)
          @project.assign_attributes(position:Project.last.position + 1)
          if @project.valid?
            if params["tags"]
              tags = params["tags"]["ids"]
              tags.each do |id|
                @project.tags << Refinery::Tags::Tag.find(id)
              end
            end
            @project.save
            flash.notice = t(
            'refinery.crudify.created',
            :what => "#{params["project"]["name"]}"
            )
            create_or_update_successful
          else
            @tags = Refinery::Tags::Tag.all
            create_or_update_unsuccessful 'new'
          end
        end

        def update
          @project = Refinery::Projects::Project.find_by(id: params[:id])

          @project.assign_attributes(project_params)
          if @project.valid?
            if params["tags"]
              @project.taggings.destroy_all
              tags = params["tags"]["ids"]
              tags.each do |id|
                @project.tags << Refinery::Tags::Tag.find(id)
              end
            end
            @project.save
            flash.notice = t(
            'refinery.crudify.updated',
            :what => "#{@project.name}"
            )
            create_or_update_successful
          else
            @tags = Refinery::Tags::Tag.all
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
          [:name, :description, :team_name, :location, :area, :completion_date, :featured, :featured_image_id]
        end

        protected

        # def find_all_categories
        #   @categories = Category.all
        # end

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

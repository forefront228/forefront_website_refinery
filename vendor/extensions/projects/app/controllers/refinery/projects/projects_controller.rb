module Refinery
  module Projects
    class ProjectsController < ::ApplicationController

      before_action :find_all_projects
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @project in the line below:
        @dropdown_tags = Refinery::Tags::Tag.where({ name: %w(Residential Commercial Hospitality Institutional Community Mixed-Use)})
        @adaptive_tag = Refinery::Tags::Tag.find_by_name("Adaptive")
        @projects = Refinery::Projects::Project.eager_load(:tags,:featured_image)

        present(@page)
      end

      def show
        @project = Project.find(params[:id])
        @images = @project.images

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @project in the line below:
        present(@page)
      end

    protected

      def find_all_projects
        @projects = Project.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/projects").first
      end

    end
  end
end

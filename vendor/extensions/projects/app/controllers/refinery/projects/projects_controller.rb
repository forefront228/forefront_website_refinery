module Refinery
  module Projects
    class ProjectsController < ::ApplicationController

      before_action :find_all_projects
      before_action :find_page

      def index
        # @featured_projects = Refinery::Projects::Project.where(featured:"true").order(created_at: :desc) #For some reason these instance variables get passed through but are empty
        # @projects = Refinery::Projects::Project.where(featured:"false").order(created_at: :desc)
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @project in the line below:
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

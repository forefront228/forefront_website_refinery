module Refinery
  module Projects
    class ProjectsController < ::ApplicationController

      before_action :find_all_projects
      # before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @project in the line below:
        @tags = Refinery::Tags::Tag.all.to_a
        @dropdown_tags = @tags.select {|tag| tag.name.in?(%w(Residential Commercial Hospitality Institutional Community Mixed-Use))}
        @adaptive_tag = @tags.select {|tag| tag.name == "Adaptive"}
        @projects = Refinery::Projects::Project.eager_load(:tags,:featured_image).order(:position)
        # @projects = Refinery::Projects::Project.all.order("position ASC")
        present(@page)
      end

      def show
        @project = Project.eager_load(:featured_image,:images).where("refinery_projects.id = #{params[:id]}").first
        redirect_to refinery.projects_projects_path unless @project
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

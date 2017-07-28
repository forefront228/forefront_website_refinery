module Refinery
  module TeamMembers
    class TeamMembersController < ::ApplicationController

      before_action :find_all_team_members
      # before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @team_member in the line below:
        @team = Refinery::CustomPages::CustomPage.find_by_name("Team")
        @team_members = TeamMember.includes(:primary_image)
        # present(@page)
      end

      def show
        @team_member = TeamMember.find_by_id(params[:id])
        redirect_to refinery.team_members_path unless @team_member

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @team_member in the line below:
        # present(@page)
      end

    protected

      def find_all_team_members
        @team_members = TeamMember.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/team_members").first
      end

    end
  end
end

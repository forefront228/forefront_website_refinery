module Refinery
  module TeamMembers
    module Admin
      class TeamMembersController < ::Refinery::AdminController

        crudify :'refinery/team_members/team_member',
                :title_attribute => 'first_name'

        def update
          @team_member = TeamMember.find(params[:id])

          @team_member.assign_attributes(team_member_params)
          if @team_member.valid?
            @team_member.save
            flash.notice = t(
            'refinery.crudify.updated',
            :what => "#{@team_member.first_name}"
            )
            create_or_update_successful
          else
            create_or_update_unsuccessful 'edit'
          end
        end


        def team_member_params
          params.require(:team_member).permit(permitted_team_member_params)
        end

        # Only allow a trusted parameter "white list" through.
        def permitted_team_member_params
          [:first_name, :last_name, :role, :bio, :primary_image_id, :secondary_image_id]
        end



        # Below was the initial file configuration. Changed for the purpose of implementing image collections for TeamMember
        # private
        #
        # # Only allow a trusted parameter "white list" through.
        # def team_member_params
        #   params.require(:team_member).permit(:first_name, :last_name, :role, :bio, :primary_image_id, :secondary_image_id)
        # end
      end
    end
  end
end

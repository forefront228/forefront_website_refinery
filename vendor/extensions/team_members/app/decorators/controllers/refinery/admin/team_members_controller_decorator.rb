module RefineryPageImagesTeamMembersControllerDecorator
  def permitted_team_member_params
    # Hand the case where all images have been deleted
    params[:team_member][:images_attributes]={} if params[:team_member][:images_attributes].nil?
    super <<  [images_attributes: [:id, :caption, :image_page_id]]
  end
end

Refinery::TeamMembers::Admin::TeamMembersController.send :prepend, RefineryPageImagesTeamMembersControllerDecorator

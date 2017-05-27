module RefineryPageImagesProjectsControllerDecorator
  def permitted_project_params
    # Hand the case where all images have been deleted
    params[:project][:images_attributes]={} if params[:project][:images_attributes].nil?
    super <<  [images_attributes: [:id, :caption, :image_page_id]]
  end
end

Refinery::Projects::Admin::ProjectsController.send :prepend, RefineryPageImagesProjectsControllerDecorator

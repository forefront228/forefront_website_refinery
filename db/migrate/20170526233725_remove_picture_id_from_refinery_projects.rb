class RemovePictureIdFromRefineryProjects < ActiveRecord::Migration
  def change
    remove_column :refinery_projects, :picture_id
  end
end

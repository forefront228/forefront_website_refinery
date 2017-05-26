class AddFeaturedImageToRefineryProjects < ActiveRecord::Migration
  def change
    add_column :refinery_projects, :featured_image_id, :integer
  end
end

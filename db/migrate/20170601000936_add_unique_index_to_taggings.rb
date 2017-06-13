class AddUniqueIndexToTaggings < ActiveRecord::Migration
  def change
    add_index :taggings, [:project_id, :tag_id], unique: true
  end
end

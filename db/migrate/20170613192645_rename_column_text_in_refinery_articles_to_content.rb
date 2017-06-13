class RenameColumnTextInRefineryArticlesToContent < ActiveRecord::Migration
  def change
    rename_column :refinery_articles, :text, :content
  end
end

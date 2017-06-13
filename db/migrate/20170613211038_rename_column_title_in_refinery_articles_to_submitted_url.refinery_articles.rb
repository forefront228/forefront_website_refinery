# This migration comes from refinery_articles (originally 2)
class RenameColumnTitleInRefineryArticlesToSubmittedUrl < ActiveRecord::Migration
  def change
    rename_column :refinery_articles, :title, :submitted_url
  end
end

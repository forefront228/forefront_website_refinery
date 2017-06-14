# This migration comes from refinery_articles (originally 1)
class CreateArticlesArticles < ActiveRecord::Migration

  def up
    create_table :refinery_articles do |t|
      t.text :content
      t.string :submitted_url
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-articles"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/articles/articles"})
    end

    drop_table :refinery_articles

  end

end

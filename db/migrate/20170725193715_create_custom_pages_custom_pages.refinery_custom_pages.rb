# This migration comes from refinery_custom_pages (originally 1)
class CreateCustomPagesCustomPages < ActiveRecord::Migration

  def up
    create_table :refinery_custom_pages do |t|
      t.string :name
      t.integer :hero_image_id
      t.string :hero_banner_text
      t.text :body
      t.string :body_header
      t.string :address_line_1
      t.string :address_line_2
      t.string :city_state_zip
      t.string :phone_number
      t.string :email_address
      t.text :map_embed
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-custom_pages"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/custom_pages/custom_pages"})
    end

    drop_table :refinery_custom_pages

  end

end

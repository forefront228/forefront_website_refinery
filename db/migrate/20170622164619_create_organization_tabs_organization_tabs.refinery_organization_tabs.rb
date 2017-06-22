# This migration comes from refinery_organization_tabs (originally 1)
class CreateOrganizationTabsOrganizationTabs < ActiveRecord::Migration

  def up
    create_table :refinery_organization_tabs do |t|
      t.string :tab_name
      t.text :body
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-organization_tabs"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/organization_tabs/organization_tabs"})
    end

    drop_table :refinery_organization_tabs

  end

end

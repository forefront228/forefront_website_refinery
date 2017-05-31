class CreateTeamMembersTeamMembers < ActiveRecord::Migration

  def up
    create_table :refinery_team_members do |t|
      t.string :first_name
      t.string :last_name
      t.string :role
      t.text :bio
      t.integer :primary_image_id
      t.integer :secondary_image_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-team_members"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/team_members/team_members"})
    end

    drop_table :refinery_team_members

  end

end

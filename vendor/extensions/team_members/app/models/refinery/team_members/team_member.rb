module Refinery
  module TeamMembers
    class TeamMember < Refinery::Core::BaseModel
      self.table_name = 'refinery_team_members'


      validates :first_name, :presence => true, :uniqueness => true

      belongs_to :primary_image, :class_name => '::Refinery::Image'

      belongs_to :secondary_image, :class_name => '::Refinery::Image'

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end

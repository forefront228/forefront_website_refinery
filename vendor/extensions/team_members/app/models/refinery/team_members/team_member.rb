module Refinery
  module TeamMembers
    class TeamMember < Refinery::Core::BaseModel
      self.table_name = 'refinery_team_members'

      has_many_page_images
      belongs_to :primary_image, :class_name => '::Refinery::Image'
      belongs_to :secondary_image, :class_name => '::Refinery::Image'
      
      validates :first_name, presence: true, uniqueness: true
      validates :primary_image, :secondary_image, presence: true

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

      private

      def set_default_images
        self.primary_image ||= Refinery::Image.find_by_image_name('team1.png')
        self.secondary_image ||= Refinery::Image.find_by_image_name('bg-1.jpg')
      end

    end
  end
end

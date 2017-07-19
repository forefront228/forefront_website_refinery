module Refinery
  module TeamMembers
    class TeamMember < Refinery::Core::BaseModel
      self.table_name = 'refinery_team_members'

      has_many_page_images
      belongs_to :primary_image, :class_name => '::Refinery::Image'
      belongs_to :secondary_image, :class_name => '::Refinery::Image'
      
      validates :first_name, presence: true, uniqueness: true
      validates :primary_image, :secondary_image, presence: true

      before_validation :set_secondary_image, if: :secondary_image_nil?
      before_save :add_primary_image_to_images, if: :primary_image_id_changed?
      before_save :add_secondary_image_to_images, if: :secondary_image_id_changed?



      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

      private

      def add_primary_image_to_images
        self.images << self.primary_image unless self.images.include?(self.primary_image)
      end

      def add_secondary_image_to_images
        self.images << self.secondary_image unless self.images.include?(self.secondary_image)
      end

      def secondary_image_nil?
        self.secondary_image.nil?
      end

      def set_secondary_image
        self.secondary_image = self.primary_image
      end

    end
  end
end

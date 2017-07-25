module Refinery
  module CustomPages
    class CustomPage < Refinery::Core::BaseModel
      self.table_name = 'refinery_custom_pages'


      validates :name, :presence => true, :uniqueness => true

      belongs_to :hero_image, :class_name => '::Refinery::Image'

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end

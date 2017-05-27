module Refinery
  module Projects
    class Project < Refinery::Core::BaseModel
      self.table_name = 'refinery_projects'


      validates :name, :presence => true, :uniqueness => true

      has_many_page_images
      belongs_to :featured_image, class_name: ::Refinery::Image
      belongs_to :category
      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end

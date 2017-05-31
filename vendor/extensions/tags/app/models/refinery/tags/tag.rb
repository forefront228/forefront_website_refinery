module Refinery
  module Tags
    class Tag < Refinery::Core::BaseModel
      self.table_name = 'refinery_tags'


      validates :name, :presence => true, :uniqueness => true
      has_many :taggings
      has_many :projects, through: :taggings
      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end

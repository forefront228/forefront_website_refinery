module Refinery
  module Articles
    class Article < Refinery::Core::BaseModel
      self.table_name = 'refinery_articles'


      validates :title, :presence => true, :uniqueness => true

      belongs_to :user, class_name: ::Refinery::Authentication::Devise::User
      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end

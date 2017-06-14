module Refinery
  module Articles
    class Article < Refinery::Core::BaseModel
      self.table_name = 'refinery_articles'


      validates :content, :presence => true, :uniqueness => true

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

      def thumbnailer_object
        return LinkThumbnailer.generate(self.submitted_url)
      end

    end
  end
end

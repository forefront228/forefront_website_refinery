module Refinery
  module Articles
    class Article < Refinery::Core::BaseModel
      self.table_name = 'refinery_articles'


      validates :content, :presence => true, :uniqueness => true

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

      def thumbnailer_videos
        LinkThumbnailer.generate(self.submitted_url).videos
      end

      def thumbnailer_images
        if LinkThumbnailer.generate(self.submitted_url).images[0]
          LinkThumbnailer.generate(self.submitted_url).images[0].src
        end
      end

    end
  end
end

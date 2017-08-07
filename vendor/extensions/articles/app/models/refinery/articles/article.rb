module Refinery
  module Articles
    class Article < Refinery::Core::BaseModel
      self.table_name = 'refinery_articles'
      after_create :make_first_position

      validates :content, :presence => true, :uniqueness => true

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

      def make_first_position
        self.assign_attributes(position: Article.all.pluck(:position).map(&:to_i).min)
        Article.where('linkedin_timestamp != ?', self.linkedin_timestamp).where('position >= ? OR position IS NULL', self.position).each do |a|
          a.update_attributes(position: a.position + 1 )
        end
        self.save
      end

    end
  end
end

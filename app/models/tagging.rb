class Tagging < ActiveRecord::Base

  validates_uniqueness_of :project_id, scope: :tag_id

  belongs_to :project, class_name: ::Refinery::Projects::Project
  belongs_to :tag, class_name: ::Refinery::Tags::Tag
end

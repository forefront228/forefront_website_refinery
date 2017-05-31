class Tagging < ActiveRecord::Base
  belongs_to :project, class_name: ::Refinery::Projects::Project
  belongs_to :tag, class_name: ::Refinery::Tags::Tag
end

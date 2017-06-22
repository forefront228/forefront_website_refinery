module Refinery
  module OrganizationTabs
    class OrganizationTab < Refinery::Core::BaseModel
      self.table_name = 'refinery_organization_tabs'


      validates :tab_name, :presence => true, :uniqueness => true

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end

module Refinery
  module OrganizationTabs
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::OrganizationTabs

      engine_name :refinery_organization_tabs

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "organization_tabs"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.organization_tabs_admin_organization_tabs_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::OrganizationTabs)
      end
    end
  end
end

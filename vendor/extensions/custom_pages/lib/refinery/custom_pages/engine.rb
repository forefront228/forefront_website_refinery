module Refinery
  module CustomPages
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::CustomPages

      engine_name :refinery_custom_pages

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "custom_pages"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.custom_pages_admin_custom_pages_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::CustomPages)
      end
    end
  end
end

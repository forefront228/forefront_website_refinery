module Refinery
  module Articles
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Articles

      engine_name :refinery_articles

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "articles"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.articles_admin_articles_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Articles)
      end
    end
  end
end

require 'refinerycms-core'

module Refinery
  autoload :ProjectsGenerator, 'generators/refinery/projects_generator'

  module Projects
    require 'refinery/projects/engine'

    autoload :Tab, 'refinery/projects/tabs'

    class << self
      attr_writer :root
      attr_writer :tabs

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def tabs
        @tabs ||= []
      end


      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end

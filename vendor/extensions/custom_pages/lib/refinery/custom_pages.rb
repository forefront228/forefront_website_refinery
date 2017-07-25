require 'refinerycms-core'

module Refinery
  autoload :CustomPagesGenerator, 'generators/refinery/custom_pages_generator'

  module CustomPages
    require 'refinery/custom_pages/engine'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end

module IOMatic
  module Viewable
    module ClassMethods
      attr_reader :viewable_renderer

      def setup_renderer renderer
        @viewable_renderer = renderer
      end # setup_renderer
    end # ClassMethods
  end
end
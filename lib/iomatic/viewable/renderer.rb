module IOMatic
  module Viewable
    # Default renderer class to provide you with an example of how
    # to build a renderer. Be sure to override to_viewable to 
    # complete the api
    class Renderer
      def call object
        object.to_s
      end # call
    end # Renderer
  end
end
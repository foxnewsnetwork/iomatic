# Exposed API
# 1. setup_renderer - give it a renderer which responds to call 

module IOMatic
	module Viewable
		autoload :ClassMethods, File.join(File.dirname(__FILE__), "viewable", "class_methods")
		autoload :Renderer, File.join(File.dirname(__FILE__), "viewable", "renderer")

		# used to hook in class methods also
		def self.included base
			base.extend ClassMethods
		end # includeded base

		# the render function; uses the viewable_renderer
		# to generate a view. It necessarily returns some
		# sort of relevant view context, but what that
		# context actually consists of is up to implementation
		def render
			self.class.viewable_renderer.call self
		end # render
	end # Viewable
end # IOMatic
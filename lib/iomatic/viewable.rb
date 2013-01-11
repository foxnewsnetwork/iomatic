# Exposed API
# 1. setup_renderer - give it a renderer which responds to call 

module IOMatic
	module Viewable
		# used to hook in class methods also
		def self.included base
			base.extend ClassMethods
			base.include IOMatic
		end # includeded base

		# takes something that is iomatic
		# and returns some sort of application-
		# specific view context. We do json as
		# a default, but it really isn't necessary
		def to_viewable
			to_json
		end # to_viewable

		# the render function; no real reason to
		# mess with this, it renders based upon
		# what renderer you've set up. It returns
		# an error array.
		def render
			viewable_renderer.call to_viewable
		end # render
	end # Viewable
end # IOMatic
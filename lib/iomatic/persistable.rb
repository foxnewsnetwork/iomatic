# persistable are things that can be persisted to a db
# and can also be extracted from a db. As such, these
# things expose global state

require File.join(File.dirname(__FILE__), "persistable","class_methods")
module IOMatic
	# Every persistable module MUST expose a hash_key function
	# which produces an unique key which allows state to return
	# the object.
	module Persistable
		def self.included base
			base.extend ClassMethods
		end # included

		# Must return an unique string
		def to_key
			to_persistable.id
		end # hash_key

		# Same thing as active_record's to_param
		def to_param

		end # to_param

		# persists
		def to_persistable
			to_json
		end # to_persistable

		# saves to the database.
		# No real reason to mess around with this
		def serialize
			self.class.persistable_serializer.call to_persistable
		end # serialize
	end # Persistable
end # IOMatic
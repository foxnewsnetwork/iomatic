# IO-matic is the monadic io context for getting pure
# Ruby things to perform IO. IO includes such things
# as rendering views, sending emails, persisting to db
# and whatnot

# Calling include on IOMatic is just like the pure function
module IOMatic
  autoload :Persistable, File.join(File.dirname(__FILE__), "iomatic", "persistable")
  autoload :Viewable, File.join(File.dirname(__FILE__), "iomatic", "viewable")
  autoload :Dispatchable, File.join(File.dirname(__FILE__), "iomatic", "dispatchable")
  autoload :Validatable, File.join(File.dirname(__FILE__), "iomatic", "validatable")
	attr_accessor :monadic_context

	# Think of to_json as >>= from haskell
	# everything that is iomatic must be
	# able to become some sort of simple
	# hash-like object 
	def to_json
		throw "Not implemented"
	end # to_json
end # IOMatic
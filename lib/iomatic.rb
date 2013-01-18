# IO-matic is the monadic io context for getting pure
# Ruby things to perform IO. IO includes such things
# as rendering views, sending emails, persisting to db
# and whatnot

module IOMatic
  autoload :Viewable, File.join(File.dirname(__FILE__), "iomatic", "viewable")
  autoload :Dispatchable, File.join(File.dirname(__FILE__), "iomatic", "dispatchable")
  autoload :Validatable, File.join(File.dirname(__FILE__), "iomatic", "validatable")
  autoload :Monadic, File.join(File.dirname(__FILE__), "iomatic", "monadic")
end # IOMatic
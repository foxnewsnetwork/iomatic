module IOMatic
  module Dispatchable
    autoload :Dispatcher, File.join(File.dirname(__FILE__), "dispatchable", "dispatcher")
    autoload :ClassMethods, File.join(File.dirname(__FILE__), "dispatchable", "class_methods")
    def self.included( base )
      base.extend ClassMethods
    end # included

    # the only public api method in the entire module
    # please do not use it to make state changes to
    def dispatch
      self.class.dispatch_connection.call self
      self
    end # dispatch
  end # Dispatchable
end # IOmatic
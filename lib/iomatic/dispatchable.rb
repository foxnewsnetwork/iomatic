module IOMatic
  module Dispatchable
    autoload :Dispatcher, "dispatchable/dispatcher"
    autoload :ClassMethods, "dispatchable/class_methods"
    def self.included( base )
      base.extend ClassMethods
    end # included
  end # Dispatchable
end # IOmatic
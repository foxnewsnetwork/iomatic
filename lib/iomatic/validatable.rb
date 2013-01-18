
module IOMatic
  module Validatable
    autoload :Validator, File.join(File.dirname(__FILE__), "validatable", "validator" )
    autoload :ClassMethods, File.join(File.dirname(__FILE__), "validatable", "class_methods")

    def self.included( base )
      base.extend ClassMethods
    end

    # returns a boolean
    def valid?
      return self.class.validator.valid? self if self.class.validator.respond_to? :valid? 
      self.class.validator.call(self).empty?
    end

    # This MUST return an array. If array is empty,
    # then obviously no errors are present
    def errors
      self.class.validator.call self
    end
  end
end
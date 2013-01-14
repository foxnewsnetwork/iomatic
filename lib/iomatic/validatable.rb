
module IOMatic
  module Validatable
    autoload :Validator, "validatable/validator"
    autoload :ClassMethods, "validatable/class_methods"

    def self.included( base )
      base.extend ClassMethods
    end

    # This MUST return an array. If array is empty,
    # then obviously no errors are present
    def call object 
      self.class.validator.call object
    end

    # returns a boolean
    def errors? object
      if self.class.validator.respond_to? :errors
        self.class.validator.errors object
      else
        self.class.validator.call(object).any?
      end
    end
  end
end
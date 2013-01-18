module IOMatic
  module Validatable
    # Default implementation of something that can be used as a validator
    class Validator

      # Must return an array of presumably errors
      def call object
        []
      end

      # returns a boolean if there are errors present
      def valid? object
        self.call(object).empty?
      end
    end
  end
end
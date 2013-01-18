module IOMatic
  module Validatable
    module ClassMethods

      attr_reader :validator

      def setup_validator checker
        @validator = checker
      end
    end
  end
end
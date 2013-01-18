
module IOMatic
  module Monadic
    module ClassMethods

      attr_reader :monadic_context
      
      def setup_monad( context )
        @monadic_context = context
      end
      
    end
  end
end
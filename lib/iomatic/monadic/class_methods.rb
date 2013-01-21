
module IOMatic
  module Monadic
    module ClassMethods

      attr_reader :monadic_context
      
      def setup_monad( context )
        @monadic_context = context
      end
      
      # your block should be pure
      def liftM( context )
        if block_given?
          yield( context.purify ).contextify
        else
          context
        end
      end

    end
  end
end
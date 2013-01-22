
module IOMatic
  module Monadic
    module ClassMethods

      attr_reader :monadic_context, :monadic_zero
      
      def setup_monad( context )
        @monadic_context = context
      end


      def define_zero &block
        @monadic_zero = lambda &block
      end

      def contextify( object = nil)
        if object.nil?
          zero = monadic_zero.call
          zero.nothing_flag = true
          zero.contextify
        else
          object.contextify
        end
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
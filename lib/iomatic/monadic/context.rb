
module IOMatic

  module Monadic

    # Minimum context example, inherit and build on this
    # in later implementation to produce good stuff
    class Context

      attr_accessor :pure

      def initialize(object=nil)
        @pure = object
      end

      def nothing?
        true if @pure.nil? || @pure.nothing?
      end

      def purify
        @pure
      end

      def method_missing(method, *args)
        purify.send(method, *args)
      end

    end

  end

end
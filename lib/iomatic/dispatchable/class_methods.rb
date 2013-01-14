module IOMatic
  module Dispatchable
    module ClassMethods
      attr_reader :dispatch_connection

      def connect_external dispatcher
        @dispatch_connection = dispatcher
      end
    end
  end
end
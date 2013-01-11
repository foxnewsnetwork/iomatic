

module IOMatic
  module Persistable
    module ClassMethods
      attr_accessor :persistable_finder, :persistable_deserializer, :persistable_serializer

      def find *args
        object = persistable_finder.call *args
        persistable_deserializer.call object
      end # find
      def deserialize object
        persistable_deserializer
      end # deserialize

      def setup_finder finder
        persistable_finder = finder
      end # setup_finder

      def setup_deserializer deserializer
        persistable_deserializer = deserializer
      end # setup_deserializer

      def setup_serializer serializer
        persistable_serializer = serializer
      end # setup_serializer
    end # ClassMethods
  end # Persistable
end # IOMatic
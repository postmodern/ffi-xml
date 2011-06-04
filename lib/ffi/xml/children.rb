require 'ffi/xml/xml'

module FFI
  module XML
    class Children

      include Enumerable

      def initialize(node)
        @node = node
      end

      def [](index)
        # TODO: implement
      end

      def []=(index,node)
        # TODO: implement
      end

      def each
        # TODO: implement
      end

      def <<(node)
        XML.xmlAddChild(@node,node)
      end

      def length
        XML.xmlChildElementCount(@node)
      end

      alias count length

    end
  end
end

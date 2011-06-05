require 'ffi/xml/xml'

module FFI
  module XML
    class Children

      include Enumerable

      def initialize(node)
        @node = node
      end

      def [](key)
        each_with_index do |node,index|
          break node if index == key
        end
      end

      def []=(index,node)
        # TODO: implement
      end

      def each
        return enum_for unless block_given?

        child = Node.new(@node[:children])

        until child.null?
          yield child

          child = child.next
        end
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

require 'ffi/xml/node'

require 'ffi'

module FFI
  module XML
    class NodeSet < FFI::Struct

      include Enumerable

      layout :nodeNr, :int,
             :nodeMax, :int,
             :nodeTab, :pointer

      def at(key)
        if (key >= 0 && key < size)
          Node.new(self[:nodeTab].get_pointer(key))
        end
      end

      def [](key)
        case key
        when Integer
          at(key)
        else
          super(key)
        end
      end

      def each
        size.times do |index|
          yield at(index)
        end
      end

      def length
        self[:nodeNr]
      end

    end
  end
end

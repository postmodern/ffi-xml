require 'ffi/xml/node'
require 'ffi/xml/xml'

require 'ffi'

module FFI
  module XML
    module XPath
      class NodeSet < FFI::Struct

        include Enumerable

        layout :nodeNr, :int,
               :nodeMax, :int,
               :nodeTab, :pointer

        def at(key)
          if (!empty? && key >= 0 && key < size)
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

        def empty?
          (self[:nodeNr] == 0) || self[:nodeTab].null?
        end

        def to_s
          XML.xmlXPathCaseNodeSetToString(self).get_string(0)
        end

        def to_f
          XML.xmlXPathCastNodeSetToNumber(self)
        end

        def to_i
          to_f.to_i
        end

        def finalize
          XML.xmlXPathFreeNodeSet(self)
        end

      end
    end
  end
end

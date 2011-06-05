require 'ffi/xml/xpath/types'
require 'ffi/xml/xpath/node_set'
require 'ffi/xml/xml'

module FFI
  module XML
    class XPathObject < FFI::Struct

      layout :type, :xmlXPathObjectType,
             :nodesetval, :xmlNodeSetPtr,
             :boolval, :int,
             :floatval, :double,
             :stringval, :xmlCharPtr,
             :user, :pointer,
             :index, :int,
             :user2, :pointer,
             :index2, :pointer

      def undefined?
        self[:type] == :undefined
      end

      def nodeset?
        self[:type] == :nodeset
      end

      def boolean?
        self[:type] == :boolean
      end

      def number?
        self[:type] == :number
      end

      def string?
        self[:type] == :string
      end

      def point?
        self[:type] == :point
      end

      def range?
        self[:type] == :range
      end

      def location_set?
        self[:type] == :location_set
      end

      def users?
        self[:type] == :users
      end

      def xslt_tree?
        self[:type] == :xslt_tree
      end

      def nodeset
        @nodeset ||= if nodeset?
                       NodeSet.new(self[:nodesetval])
                     end
      end

      alias nodes nodeset

      def [](key)
        case key
        when Integer
          nodeset[key] if nodeset?
        else
          super(key)
        end
      end

      def each(&block)
        if nodeset?
          nodeset.each(&block)
        end
      end

      def to_s
        XML.xmlXPathCastToString(self).get_string(0)
      end

      def to_f
        XML.xmlXPathCastToNumber(self)
      end

      def to_i
        to_f.to_i
      end

      def to_a
        if nodeset?
          nodeset.to_a
        else
          []
        end
      end

      def finalize
        XML.xmlXPathFreeObject(self)
      end

    end
  end
end

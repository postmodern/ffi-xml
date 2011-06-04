require 'ffi/xml/node_set'
require 'ffi/xml/types'
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
        @nodeset ||= NodeSet.new(self[:nodesetval])
      end

      alias nodes nodeset

      def finalize
        XML.xmlXPathFreeObject(self)
      end

    end
  end
end

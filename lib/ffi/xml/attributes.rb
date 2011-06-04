require 'ffi/xml/attr'
require 'ffi/xml/xml'

module FFI
  module XML
    class Attributes

      include Enumerable

      def initialize(node)
        @node = node
      end

      def [](name,namespace=nil)
        if namespace
          XML.xmlGetNsProp(@node,name,namespace)
        else
          XML.xmlGetProp(@node,name)
        end
      end

      def []=(node,value)
        XML.xmlSetProp(@node,name,value)
      end

      def has?(name,namespace=nil)
        if namespace
          XML.xmlHasNsProp(@node,name,namespace)
        else
          XML.xmlHasProp(@node,name,namespace)
        end
      end

      def unset!(name,ns=nil)
        if ns
          XML.xmlUnsetNsProp(@node,ns,name,value)
        else
          XML.xmlUnsetProp(@node,ns,name,value)
        end
      end

      def each
        # TODO: implement
      end

      def to_hash
        hash = {}

        each do |attr|
          hash[attr.name] = attr.content
        end

        return hash
      end

    end
  end
end

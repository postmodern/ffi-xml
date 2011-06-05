require 'ffi/xml/attr'
require 'ffi/xml/xml'

module FFI
  module XML
    class Attributes

      include Enumerable

      def initialize(node)
        @node = node
      end

      def [](key,namespace=nil)
        case key
        when Symbol, String
          name = name.to_s

          if namespace
            Attr.new(XML.xmlGetNsProp(@node,name,namespace))
          else
            Attr.new(XML.xmlGetProp(@node,name))
          end
        when Integer
          each_with_index do |attr,index|
            break attr if index == key
          end
        else
          raise("key must be either a Symbol, String or Integer")
        end
      end

      def []=(node,value)
        XML.xmlSetProp(@node,name.to_s,value)
      end

      def has?(name,namespace=nil)
        if namespace
          !XML.xmlHasNsProp(@node,name,namespace).null?
        else
          !XML.xmlHasProp(@node,name).null?
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
        return enum_for unless block_given?

        attr = Attr.new(@node[:properties])

        until attr.null?
          yield attr

          attr = attr.next
        end
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

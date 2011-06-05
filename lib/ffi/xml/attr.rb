require 'ffi/xml/xml'
require 'ffi/xml/node_like'

require 'ffi'

module FFI
  module XML
    class Attr < FFI::Struct

      include NodeLike

      layout :_private, :pointer,
             :type, :xmlElementType,
             :name, :xmlCharPtr,
             :children, :xmlNodePtr,
             :last, :xmlNodePtr,
             :parent, :xmlNodePtr,
             :next, :xmlNodePtr,
             :prev, :xmlNodePtr,
             :doc, :xmlDocPtr,
             :ns, :xmlNsPtr,
             :atype, :xmlAttributeType,
             :psvi, :pointer

      def next
        Attr.new(self[:next])
      end

      def prev
        Attr.new(self[:prev])
      end

      def attribute_type
        self[:atype]
      end

      def content
        root.content
      end

      def serialize(buffer,text)
        XML.xmlAttrSerializeTxtContent(buffer,self[:doc],self,text)
      end

      def remove!
        XML.xmlRemoveProp(self)
      end

      def copy(recursive=false)
        if recursive
          XML.xmlCopyProp(self[:parent],self)
        else
          XML.xmlCopyPropList(self[:parent],self)
        end
      end

    end
  end
end

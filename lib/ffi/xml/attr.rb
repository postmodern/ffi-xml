require 'ffi/xml/xml'

require 'ffi'

module FFI
  module XML
    class Attr < FFI::Struct

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

      def serialize(buffer,text)
        XML.xmlAttrSerializeTxtContent(buffer,self[:doc],self,text)
      end

      def attribute_type
        self[:atype]
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

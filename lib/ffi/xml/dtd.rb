require 'ffi/xml/types'

require 'ffi'

module FFI
  module XML
    class DTD < FFI::Struct

      layout :_private, :pointer,
             :type, :xmlElementType,
             :name, :xmlCharPtr,
             :children, :xmlNodePtr,
             :last, :xmlNodePtr,
             :parent, :xmlNodePtr,
             :next, :xmlNodePtr,
             :prev, :xmlNodePtr,
             :doc, :xmlDocPtr,
             :notations, :pointer,
             :elements, :pointer,
             :attributes, :pointer,
             :entities, :pointer,
             :ExternalID, :xmlCharPtr,
             :SystemID, :xmlCharPtr,
             :pentities, :pointer

      def copy
        XML.xmlCopyDtd(self)
      end

    end
  end
end

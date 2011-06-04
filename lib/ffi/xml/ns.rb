module FFI
  module XML
    class NS < FFI::Struct

      layout :next, :xmlNsPtr,
             :type, :xmlNsType,
             :href, :xmlCharPtr,
             :prefix, :xmlCharPtr,
             :_private, :pointer,
             :context, :xmlDocPtr

      def href
        self[:href].get_string(0)
      end

      def prefix
        self[:prefix].get_string(0)
      end

      def copy(deep=false)
        if deep
          XML.xmlCopyNamespaceList(self)
        else
          XML.xmlCopyNamespace(self)
        end
      end

    end
  end
end

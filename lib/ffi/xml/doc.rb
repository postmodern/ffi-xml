require 'ffi/xml/xpath_context'
require 'ffi/xml/xml'

module FFI
  module XML
    class Doc < FFI::Struct

      layout :_private, :pointer,
             :type, :xmlElementType,
             :name, :pointer,
             :children, :xmlNodePtr,
             :last, :xmlNodePtr,
             :parent, :xmlNodePtr,
             :next, :xmlNodePtr,
             :prev, :xmlNodePtr,
             :doc, :xmlDocPtr,
             :compression, :int,
             :standalone, :int,
             :intSubset, :xmlDtdPtr,
             :extSubset, :xmlDtdPtr,
             :oldNs, :xmlNsPtr,
             :version, :xmlCharPtr,
             :encoding, :xmlCharPtr,
             :ids, :pointer,
             :refs, :pointer,
             :url, :xmlCharPtr,
             :charset, :int,
             :dict, :xmlDictPtr,
             :psvi, :pointer,
             :parseFlags, :int,
             :properties, :int

      def self.parse(data)
      end

      def self.parse_stream(stream)
      end

      def self.parse_file(path)
        new(XML.xmlParseFile(path))
      end

      def type
        self[:type]
      end

      def name
        unless self[:name].null?
          self[:name].get_string(0)
        end
      end

      def compression
        XML.xmlGetDocCompressMode(self)
      end

      def compression=(mode)
        XML.xmlSetDocCompressMode(self,mode)
      end

      def standalone
        self[:standalone]
      end

      def version
        unless self[:version].null?
          self[:version].get_string(0)
        end
      end

      def encoding
        unless self[:encoding].null?
          self[:encoding].get_string(0)
        end
      end

      def charset
        self[:charset]
      end

      def dtd
        XML.xmlGetIntSubset(self)
      end

      def root
        XML.xmlDocGetRootElement(self)
      end

      def root=(node)
        XMl.xmlDocSetRootElement(self,node)
      end

      def xpath(expression)
        XPathContext.new(self).evaluate(expression)
      end

      def create_internal_subset(name,external_id,system_id)
        XML.xmlCreateIntSubset(self,name,external_id,system_id)
      end

      def copy(recursive=false)
        XML.xmlCopyDoc(self,recursive ? 1 : 0)
      end

      def save(filename,encoding=nil)
        if encoding
          XML.xmlSaveFileEnc(filename,self,encoding)
        else
          XML.xmlSaveFile(filename,self)
        end
      end

      def finalize
        XML.xmlFreeDoc(self)
      end

    end
  end
end

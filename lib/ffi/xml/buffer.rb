require 'ffi/xml/type'

module FFI
  module XML
    class Buffer < FFI::Struct

      layout :content, :xmlCharPtr,
             :use, :uint,
             :size, :uint,
             :alloc, :xmlBufferAllocationScheme,
             :contentIO, :xmlCharPtr

      def Buffer.allocation_scheme=(scheme)
        XML.xmlSetBufferAllocationScheme(scheme)
      end

      def self.create(length=nil)
        if length
          new(XML.xmlBufferCreateSize(length))
        else
          new(XML.xmlBufferCreate())
        end
      end

      def self.create_from(ptr,length)
        new(XML.xmlBufferCreateStatic(ptr,length))
      end

      def allocation_scheme=(scheme)
        XML.xmlBufferSetAllocationScheme(self,scheme)
      end

      def append(string)
        XML.xmlBufferAdd(self,string,string.length)
      end

      alias << append

      def prepend(string)
        XML.xmlBufferAddHead(self,string,string.length)
      end

      def write(string)
        XML.xmlBufferWriteChar(self,string)
      end

      def empty!
        XML.xmlBufferEmpty(self)
      end

      def grow!(length)
        XML.xmlBufferGrow(self,length)
      end

      def resize!(length)
        XML.xmlBufferResize(self,length)
      end

      def shrink!(length)
        XML.xmlBufferShrink(self,length)
      end

      def length
        self[:size]
      end

      def content
        self[:content].get_bytes(0,length)
      end

      def to_s
        content
      end

      def finalize
        XML.xmlBufferFree(self)
      end

    end
  end
end

require 'ffi/xml/types'

module FFI
  module XML
    class Error < FFI::Struct

      layout :domain, :int,
             :code, :int,
             :message, :pointer,
             :level, :xmlErrorLevel,
             :file, :pointer,
             :line, :int,
             :str1, :pointer,
             :str2, :pointer,
             :str3, :pointer,
             :int1, :int,
             :int2, :int,
             :ctxt, :pointer,
             :node, :pointer

      def domain
        self[:domain]
      end

      def code
        self[:code]
      end

      def level
        self[:level]
      end

      def message
        self[:message].get_string(0)
      end

      def line
        self[:line]
      end

      def str1
        unless self[:str1].null?
          self[:str1].get_string(0)
        end
      end

      def str2
        unless self[:str2].null?
          self[:str2].get_string(0)
        end
      end

      def str3
        unless self[:str3].null?
          self[:str3].get_string(0)
        end
      end

      def int1
        self[:int1]
      end

      def int2
        self[:int2]
      end

    end
  end
end

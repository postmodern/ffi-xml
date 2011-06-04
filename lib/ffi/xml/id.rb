require 'ffi/xml/types'

module FFI
  module XML
    class ID < FFI::Struct

      layout :next, :xmlIDPtr,
             :value, :xmlCharPtr,
             :attr, :xmlAttrPtr,
             :name, :xmlCharPtr,
             :lineno, :int,
             :doc, :xmlDocPtr

    end
  end
end

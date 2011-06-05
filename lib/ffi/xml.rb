require 'ffi/xml/version'
require 'ffi/xml/xml'
require 'ffi/xml/doc'
require 'ffi/xml/xpath'

FFI::XML.init
FFI::XML::XPath.init

module FFI
  def FFI.XML(data)
    case data
    when Pathname
      FFI::XML::Doc.parse_file(data)
    when IO
      FFI::XML::Doc.parse_stream(data)
    else
      FFI::XML::Doc.parse(data)
    end
  end
end

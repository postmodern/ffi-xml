require 'ffi/xml/xml'

module FFI
  module XML
    module XPath
      def XPath.init
        XML.xmlXPathInit
      end

      def XPath.infinite?(number)
        XML.xmlXPathIsInf(number)
      end

      def XPath.is_nan?(number)
        XML.xmlXPathIsNan(number)
      end
    end
  end
end

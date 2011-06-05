require 'ffi/xml/xpath/types'
require 'ffi/xml/xpath/object'
require 'ffi/xml/xml'

module FFI
  module XML
    class XPathContext

      attr_reader :doc

      def initialize(doc)
        @doc = doc
        @ptr = XML.xmlXPathNewContext(@doc)

        if @ptr.null?
          raise("unable to create new XPath context")
        end
      end

      def evaluate(expression)
        xpath_ptr = XML.xmlXPathEvalExpression(expression,@ptr)

        if xpath_ptr.null?
          raise("unable to evaluate xpath expression #{expression.dump}")
        end

        return XPathObject.new(xpath_ptr)
      end

      def to_ptr
        @ptr
      end

      def finalize
        if (@ptr && @ptr.null?)
          XML.xmlXPathFreeContext(@ptr)
        end
      end

    end
  end
end

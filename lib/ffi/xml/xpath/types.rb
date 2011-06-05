require 'ffi/xml/types'

module FFI
  module XML
    typedef :pointer, :xmlXPathContextPtr
    typedef :pointer, :xmlXPathCompExprPtr
    typedef :pointer, :xmlXPathObjectPtr

    enum :xmlXPathObjectType, [
      :undefined,    0,
      :nodeset,      1,
      :boolean,      2,
      :number,       3,
      :string,       4,
      :point,        5,
      :range,        6,
      :location_set, 7,
      :users,        8,
      :xslt_tree,    9
    ]
  end
end

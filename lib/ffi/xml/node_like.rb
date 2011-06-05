module FFI
  module XML
    module NodeLike
      def type
        self[:type]
      end

      def element?
        self[:type] == :element_node
      end

      def attribute?
        self[:type] == :attribute_node
      end

      def text?
        self[:type] == :text_node
      end

      def cdata?
        self[:type] == :cdata_section_node
      end

      def entity_ref?
        self[:type] == :entity_ref_node
      end

      def entity?
        self[:type] == :entity_node
      end

      def pi?
        self[:type] == :pi_node
      end

      def comment?
        self[:type] == :comment_node
      end

      def document_type?
        self[:type] == :document_type_node
      end

      def document_fragment?
        self[:type] == :document_frag_node
      end

      def notation?
        self[:type] == :notation_node
      end

      def dtd?
        self[:type] == :dtd_node
      end

      def name
        self[:name].get_string(0)
      end

      def parent
        Node.new(self[:parent])
      end

      def root
        Node.new(self[:children])
      end

      def last
        Node.new(self[:last])
      end

      def prev
        Node.new(self[:prev])
      end

      def next
        Node.new(self[:next])
      end

      def doc
        Doc.new(self[:doc])
      end
    end
  end
end

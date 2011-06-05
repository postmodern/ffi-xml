require 'ffi/xml/types'
require 'ffi/xml/attributes'
require 'ffi/xml/children'

require 'ffi'
require 'uri/generic'

module FFI
  module XML
    class Node < FFI::Struct

      layout :_private, :pointer,
             :type, :xmlElementType,
             :name, :pointer,
             :children, :xmlNodePtr,
             :last, :xmlNodePtr,
             :parent, :xmlNodePtr,
             :next, :xmlNodePtr,
             :prev, :xmlNodePtr,
             :doc, :xmlDocPtr,
             :ns, :xmlNsPtr,
             :content, :xmlCharPtr,
             :properties, :xmlAttrPtr,
             :nsDef, :xmlNsPtr,
             :psvi, :pointer,
             :line, :ushort,
             :extra, :ushort

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
        XML.xmlNodeIsText(self) == 1
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

      def name=(new_name)
        XML.xmlNodeSetName(self,new_name)
      end

      def line
        self[:line]
      end

      def base_url
        XML.xmlNodeGetBase(self[:doc],self)
      end

      def base_url=(uri)
        XML.xmlNodeSetBase(self,uri)
      end

      def lang
        XML.xmlNodeGetLang(self)
      end

      def lang=(new_lang)
        XML.xmlNodeSetLang(self,new_lang)
      end

      def namespaces
        XML.xmlGetNsList(self[:doc],self)
      end

      def namespace=(ns)
        XML.xmlSetNs(self,ns)
      end

      def find_namespace(namespace)
        case namespace
        when URI
          XML.xmlSearchNsByHref(self[:doc],self,href.to_s)
        else
          XML.xmlSearchNs(self[:doc],self,namespace)
        end
      end

      def reconiliate_namespaces
        XML.xmlReconciliateNs(self[:doc],self)
      end

      def path
        XML.xmlGetNodePath(self)
      end

      def doc=(new_doc)
        XML.xmlSetTreeDoc(self,new_doc)
      end

      def parent
        Node.new(self[:parent])
      end

      def first_child
        Node.new(self[:children])
      end

      def last_child
        Node.new(self[:last])
      end

      def prev
        Node.new(self[:prev])
      end

      def next
        Node.new(self[:next])
      end

      def first_element
        XML.xmlFirstElementChild(self)
      end

      def last_element
        XML.xmlLastElementChild(self)
      end

      def next_element_sibling
        XML.xmlNextElementSibling(self)
      end

      def prev_element_sibling
        XML.xmlPrevElementSibling(self)
      end

      def children
        @children ||= Children.new(self)
      end

      def next_sibling=(node)
        XML.xmlAddNextSibling(self,node)
      end

      def prev_sibling=(node)
        XML.xmlAddPrevSibling(self,node)
      end

      def add_sibling(node)
        XML.xmlAddSibling(self,node)
      end

      def attributes
        @attributes ||= Attributes.new(self)
      end

      def content
        XML.xmlNodeGetContent(self)
      end

      def content=(new_content)
        XML.xmlNodeSetContent(self,new_content)
      end

      def <<(content)
        XML.xmlTextConcat(self,content,content.length)
      end

      def merge!(node)
        XML.xmlTextMerge(self,node)
      end

      def blank?
        XML.xmlIsBlankNode(self)
      end

      def preserves_space?
        XML.xmlNodeGetSpacePreserve(self) == 1
      end

      def preserve_space=(mode)
        XML.xmlNodeSetSpacePreserve(self,mode ? 1 : 0)
      end

      def replace!(node)
        XML.xmlReplaceNode(self,node)
      end

      def unlink!
        XML.xmlUnlinkMode(self)
      end

      def copy(extended=false)
        XML.xmlCopyNode(self,extended ? 1 : 2)
      end

    end
  end
end

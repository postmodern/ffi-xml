require 'ffi/xml/types'
require 'ffi/xml/doc'

require 'ffi'

module FFI
  module XML
    extend FFI::Library

    # provide a similar REXML::Document / Nokogiri::Document constant
    Document = Doc

    ffi_lib 'xml2'

    attach_function :xmlCheckVersion, [:int], :void

    # encoding.h
    attach_function :UTF8Toisolat1, [:buffer_out, :pointer, :buffer_in, :pointer], :int
    attach_function :isolat1ToUTF8, [:buffer_out, :pointer, :buffer_in, :pointer], :int
    attach_function :xmlAddEncodingAlias, [:string, :string], :int
    attach_function :xmlCharEncCloseFunc, [:xmlCharEncodingHandlerPtr], :int
    attach_function :xmlCharEncFirstLine, [:xmlCharEncodingHandlerPtr, :xmlBufferPtr, :xmlBufferPtr], :int
    attach_function :xmlCharEncInFunc, [:xmlCharEncodingHandlerPtr, :xmlBufferPtr, :xmlBufferPtr], :int
    attach_function :xmlCharEncOutFunc, [:xmlCharEncodingHandlerPtr, :xmlBufferPtr, :xmlBufferPtr], :int
    attach_function :xmlCleanupCharEncodingHandlers, [], :void
    attach_function :xmlCleanupEncodingAliases, [], :void
    attach_function :xmlDelEncodingAlias, [:string], :int
    attach_function :xmlDetectCharEncoding, [:buffer_in, :int], :xmlCharEncoding
    attach_function :xmlFindCharEncodingHandler, [:string], :xmlCharEncodingHandlerPtr
    attach_function :xmlGetCharEncodingHandler, [:xmlCharEncoding], :xmlCharEncodingHandlerPtr
    attach_function :xmlGetCharEncodingName, [:xmlCharEncoding], :string
    attach_function :xmlGetEncodingAlias, [:string], :string
    attach_function :xmlInitCharEncodingHandlers, [], :void
    attach_function :xmlNewCharEncodingHandler, [:string, :xmlCharEncodingInputFunc, :xmlCharEncodingOutputFunc], :xmlCharEncodingHandlerPtr
    attach_function :xmlParseCharEncoding, [:string], :xmlCharEncoding
    attach_function :xmlRegisterCharEncodingHandler, [:xmlCharEncodingHandlerPtr], :void

    # tree.h
    attach_function :xmlAddChild, [:xmlNodePtr, :xmlNodePtr], :xmlNodePtr
    attach_function :xmlAddChildList, [:xmlNodePtr, :xmlNodePtr], :xmlNodePtr
    attach_function :xmlAddNextSibling, [:xmlNodePtr, :xmlNodePtr], :xmlNodePtr
    attach_function :xmlAddPrevSibling, [:xmlNodePtr, :xmlNodePtr], :xmlNodePtr
    attach_function :xmlAddSibling, [:xmlNodePtr, :xmlNodePtr], :xmlNodePtr
    attach_function :xmlAttrSerializeTxtContent, [:xmlBufferPtr, :xmlDocPtr, :xmlAttrPtr, :string], :void
    attach_function :xmlBufferAdd, [:xmlBufferPtr, :xmlCharPtr, :int], :int
    attach_function :xmlBufferAddHead, [:xmlBufferPtr, :xmlCharPtr, :int], :int
    attach_function :xmlBufferCCat, [:xmlBufferPtr, :string], :int
    attach_function :xmlBufferCat, [:xmlBufferPtr, :string], :int
    attach_function :xmlBufferContent, [:xmlBufferPtr], :xmlCharPtr
    attach_function :xmlBufferCreate, [], :xmlBufferPtr
    attach_function :xmlBufferCreateSize, [:size_t], :xmlBufferPtr
    attach_function :xmlBufferCreateStatic, [:pointer, :size_t], :xmlBufferPtr
    attach_function :xmlBufferDump, [:pointer, :xmlBufferPtr], :int
    attach_function :xmlBufferEmpty, [:xmlBufferPtr], :void
    attach_function :xmlBufferFree, [:xmlBufferPtr], :void
    attach_function :xmlBufferGrow, [:xmlBufferPtr, :uint], :int
    attach_function :xmlBufferLength, [:xmlBufferPtr], :int
    attach_function :xmlBufferResize, [:xmlBufferPtr, :uint], :int
    attach_function :xmlBufferSetAllocationScheme, [:xmlBufferPtr, :xmlBufferAllocationScheme], :void
    attach_function :xmlBufferShrink, [:xmlBufferPtr, :uint], :int
    attach_function :xmlBufferWriteCHAR, [:xmlBufferPtr, :xmlCharPtr], :void
    attach_function :xmlBufferWriteChar, [:xmlBufferPtr, :string], :void
    attach_function :xmlBufferWriteQuotedString, [:xmlBufferPtr, :xmlCharPtr], :void
    attach_function :xmlBuildQName, [:xmlCharPtr, :xmlCharPtr, :xmlCharPtr, :int], :xmlCharPtr
    attach_function :xmlChildElementCount, [:xmlNodePtr], :ulong
    attach_function :xmlCopyDoc, [:xmlDocPtr, :int], :xmlDocPtr
    attach_function :xmlCopyDtd, [:xmlDtdPtr], :xmlDtdPtr
    attach_function :xmlCopyNamespace, [:xmlNsPtr], :xmlNsPtr
    attach_function :xmlCopyNamespaceList, [:xmlNsPtr], :xmlNsPtr
    attach_function :xmlCopyNode, [:xmlNodePtr, :int], :xmlNodePtr
    attach_function :xmlCopyNodeList, [:xmlNodePtr], :xmlNodePtr
    attach_function :xmlCopyProp, [:xmlNodePtr, :xmlAttrPtr], :xmlAttrPtr
    attach_function :xmlCopyPropList, [:xmlNodePtr, :xmlAttrPtr], :xmlAttrPtr
    attach_function :xmlCreateIntSubset, [:xmlDocPtr, :xmlCharPtr, :xmlCharPtr, :xmlCharPtr], :xmlDtdPtr
    attach_function :xmlDOMWrapAdoptNode, [:xmlDOMWrapCtxtPtr, :xmlDocPtr, :xmlDocPtr, :xmlDocPtr, :xmlNodePtr, :int], :int
    attach_function :xmlDOMWrapCloneNode, [:xmlDOMWrapCtxtPtr, :xmlDocPtr, :xmlNodePtr, :pointer, :xmlDocPtr, :xmlNodePtr, :int, :int], :int
    attach_function :xmlDOMWrapFreeCtxt, [:xmlDOMWrapCtxtPtr], :void
    attach_function :xmlDOMWrapNewCtxt, [], :xmlDOMWrapCtxtPtr
    attach_function :xmlDOMWrapReconcileNamespaces, [:xmlDOMWrapCtxtPtr, :xmlNodePtr, :int], :int
    attach_function :xmlDOMWrapRemoveNode, [:xmlDOMWrapCtxtPtr, :xmlDocPtr, :xmlNodePtr, :int], :int
    attach_function :xmlDocCopyNode, [:xmlNodePtr, :xmlDocPtr, :int], :xmlNodePtr
    attach_function :xmlDocCopyNodeList, [:xmlDocPtr, :xmlNodePtr], :xmlNodePtr
    attach_function :xmlDocDump, [:pointer, :xmlDocPtr], :int
    attach_function :xmlDocDumpFormatMemory, [:xmlDocPtr, :pointer, :pointer, :int], :void
    attach_function :xmlDocDumpFormatMemoryEnc, [:xmlDocPtr, :pointer, :pointer, :pointer, :int], :void
    attach_function :xmlDocDumpMemory, [:xmlDocPtr, :pointer, :pointer], :void
    attach_function :xmlDocDumpMemoryEnc, [:xmlDocPtr, :pointer, :pointer, :string], :void
    attach_function :xmlDocFormatDump, [:pointer, :xmlDocPtr, :int], :int
    attach_function :xmlDocGetRootElement, [:xmlDocPtr], :xmlNodePtr
    attach_function :xmlDocSetRootElement, [:xmlDocPtr, :xmlNodePtr], :xmlNodePtr
    attach_function :xmlElemDump, [:pointer, :xmlDocPtr, :xmlNodePtr], :void
    attach_function :xmlFirstElementChild, [:xmlNodePtr], :xmlNodePtr
    attach_function :xmlFreeDoc, [:xmlDocPtr], :void
    attach_function :xmlFreeDtd, [:xmlDtdPtr], :void
    attach_function :xmlFreeNode, [:xmlNodePtr], :void
    attach_function :xmlFreeNodeList, [:xmlNodePtr], :void
    attach_function :xmlFreeNs, [:xmlNsPtr], :void
    attach_function :xmlFreeNsList, [:xmlNsPtr], :void
    attach_function :xmlFreeProp, [:xmlAttrPtr], :void
    attach_function :xmlFreePropList, [:xmlAttrPtr], :void
    attach_function :xmlGetBufferAllocationScheme, [], :xmlBufferAllocationScheme
    attach_function :xmlGetCompressMode, [], :int
    attach_function :xmlGetDocCompressMode, [:xmlDocPtr], :int
    attach_function :xmlGetIntSubset, [:xmlDocPtr], :xmlDtdPtr
    attach_function :xmlGetLastChild, [:xmlNodePtr], :xmlNodePtr
    attach_function :xmlGetLineNo, [:xmlNodePtr], :long
    attach_function :xmlGetNoNsProp, [:xmlNodePtr, :xmlCharPtr], :xmlCharPtr
    attach_function :xmlGetNodePath, [:xmlNodePtr], :xmlCharPtr
    attach_function :xmlGetNsList, [:xmlDocPtr, :xmlNodePtr], :xmlNsPtr
    attach_function :xmlGetNsProp, [:xmlNodePtr, :xmlCharPtr, :xmlCharPtr], :xmlCharPtr
    attach_function :xmlGetProp, [:xmlNodePtr, :xmlCharPtr], :xmlCharPtr
    attach_function :xmlHasNsProp, [:xmlNodePtr, :xmlCharPtr, :xmlCharPtr], :xmlAttrPtr
    attach_function :xmlHasProp, [:xmlNodePtr, :xmlCharPtr], :xmlAttrPtr
    attach_function :xmlIsBlankNode, [:xmlNodePtr], :int
    attach_function :xmlIsXHTML, [:xmlCharPtr, :xmlCharPtr], :int
    attach_function :xmlLastElementChild, [:xmlNodePtr], :xmlNodePtr
    attach_function :xmlNewCDataBlock, [:xmlDocPtr, :xmlCharPtr, :int], :xmlNodePtr
    attach_function :xmlNewCharRef, [:xmlDocPtr, :xmlCharPtr], :xmlNodePtr
    attach_function :xmlNewChild, [:xmlNodePtr, :xmlNsPtr, :xmlCharPtr, :xmlCharPtr], :xmlNodePtr
    attach_function :xmlNewComment, [:xmlCharPtr], :xmlNodePtr
    attach_function :xmlNewDoc, [:xmlCharPtr], :xmlDocPtr
    attach_function :xmlNewDocComment, [:xmlDocPtr, :xmlCharPtr], :xmlNodePtr
    attach_function :xmlNewDocFragment, [:xmlDocPtr], :xmlNodePtr
    attach_function :xmlNewDocNode, [:xmlDocPtr, :xmlNsPtr, :xmlCharPtr, :xmlCharPtr], :xmlNodePtr
    attach_function :xmlNewDocNodeEatName, [:xmlDocPtr, :xmlNsPtr, :xmlCharPtr, :xmlCharPtr], :xmlNodePtr
    attach_function :xmlNewDocPI, [:xmlDocPtr, :xmlCharPtr, :xmlCharPtr], :xmlNodePtr
    attach_function :xmlNewDocProp, [:xmlDocPtr, :xmlCharPtr, :xmlCharPtr], :xmlAttrPtr
    attach_function :xmlNewDocRawNode, [:xmlDocPtr, :xmlNsPtr, :xmlCharPtr, :xmlCharPtr], :xmlNodePtr
    attach_function :xmlNewDocText, [:xmlDocPtr, :xmlCharPtr], :xmlNodePtr
    attach_function :xmlNewDocTextLen, [:xmlDocPtr, :xmlCharPtr, :int], :xmlNodePtr
    attach_function :xmlNewDtd, [:xmlDocPtr, :xmlCharPtr, :xmlCharPtr, :xmlCharPtr], :xmlDtdPtr
    attach_function :xmlNewGlobalNs, [:xmlDocPtr, :xmlCharPtr, :xmlCharPtr], :xmlNsPtr
    attach_function :xmlNewNode, [:xmlNsPtr, :xmlCharPtr], :xmlNodePtr
    attach_function :xmlNewNodeEatName, [:xmlNsPtr, :xmlCharPtr], :xmlNodePtr
    attach_function :xmlNewNs, [:xmlNodePtr, :xmlCharPtr, :xmlCharPtr], :xmlNsPtr
    attach_function :xmlNewNsProp, [:xmlNodePtr, :xmlNsPtr, :xmlCharPtr, :xmlCharPtr], :xmlAttrPtr
    attach_function :xmlNewNsPropEatName, [:xmlNodePtr, :xmlNsPtr, :xmlCharPtr, :xmlCharPtr], :xmlAttrPtr
    attach_function :xmlNewPI, [:xmlCharPtr, :xmlCharPtr], :xmlNodePtr
    attach_function :xmlNewProp, [:xmlNodePtr, :xmlCharPtr, :xmlCharPtr], :xmlAttrPtr
    attach_function :xmlNewReference, [:xmlDocPtr, :xmlCharPtr], :xmlNodePtr
    attach_function :xmlNewText, [:xmlCharPtr], :xmlNodePtr
    attach_function :xmlNewTextChild, [:xmlNodePtr, :xmlNsPtr, :xmlCharPtr, :xmlCharPtr], :xmlNodePtr
    attach_function :xmlNewTextLen, [:xmlCharPtr, :int], :xmlNodePtr
    attach_function :xmlNextElementSibling, [:xmlNodePtr], :xmlNodePtr
    attach_function :xmlNodeAddContent, [:xmlNodePtr, :xmlCharPtr], :void
    attach_function :xmlNodeAddContentLen, [:xmlNodePtr, :xmlCharPtr, :int], :void
    attach_function :xmlNodeBufGetContent, [:xmlBufferPtr, :xmlNodePtr], :int
    attach_function :xmlNodeDump, [:xmlBufferPtr, :xmlDocPtr, :xmlNodePtr, :int, :int], :int
    attach_function :xmlNodeDumpOutput, [:xmlOutputBufferPtr, :xmlDocPtr, :xmlNodePtr, :int, :int, :string], :void
    attach_function :xmlNodeGetBase, [:xmlDocPtr, :xmlNodePtr], :xmlCharPtr
    attach_function :xmlNodeGetContent, [:xmlNodePtr], :xmlCharPtr
    attach_function :xmlNodeGetLang, [:xmlNodePtr], :xmlCharPtr
    attach_function :xmlNodeGetSpacePreserve, [:xmlNodePtr], :int
    attach_function :xmlNodeIsText, [:xmlNodePtr], :int
    attach_function :xmlNodeListGetRawString, [:xmlDocPtr, :xmlNodePtr, :int], :xmlCharPtr
    attach_function :xmlNodeListGetString, [:xmlDocPtr, :xmlNodePtr, :int], :xmlCharPtr
    attach_function :xmlNodeSetBase, [:xmlNodePtr, :xmlCharPtr], :void
    attach_function :xmlNodeSetContent, [:xmlNodePtr, :xmlCharPtr], :void
    attach_function :xmlNodeSetContentLen, [:xmlNodePtr, :xmlCharPtr, :int], :void
    attach_function :xmlNodeSetLang, [:xmlNodePtr, :xmlCharPtr], :void
    attach_function :xmlNodeSetName, [:xmlNodePtr, :xmlCharPtr], :void
    attach_function :xmlNodeSetSpacePreserve, [:xmlNodePtr, :int], :void
    attach_function :xmlPreviousElementSibling, [:xmlNodePtr], :xmlNodePtr
    attach_function :xmlReconciliateNs, [:xmlDocPtr, :xmlNodePtr], :int
    attach_function :xmlRemoveProp, [:xmlAttrPtr], :int
    attach_function :xmlReplaceNode, [:xmlNodePtr, :xmlNodePtr], :xmlNodePtr
    attach_function :xmlSaveFile, [:string, :xmlDocPtr], :int
    attach_function :xmlSaveFileEnc, [:string, :xmlDocPtr, :string], :int
    attach_function :xmlSaveFileTo, [:xmlOutputBufferPtr, :xmlDocPtr, :string], :int
    attach_function :xmlSaveFormatFile, [:string, :xmlDocPtr, :int], :int
    attach_function :xmlSaveFormatFileEnc, [:string, :xmlDocPtr, :string, :int], :int
    attach_function :xmlSaveFormatFileTo, [:xmlOutputBufferPtr, :xmlDocPtr, :string, :int], :int
    attach_function :xmlSearchNs, [:xmlDocPtr, :xmlNodePtr, :xmlChar], :xmlNsPtr
    attach_function :xmlSearchNsByHref, [:xmlDocPtr, :xmlNodePtr, :xmlCharPtr], :xmlNsPtr
    attach_function :xmlSetBufferAllocationScheme, [:xmlBufferAllocationScheme], :void
    attach_function :xmlSetCompressMode, [:int], :void
    attach_function :xmlSetDocCompressMode, [:xmlDocPtr, :int], :void
    attach_function :xmlSetListDoc, [:xmlNodePtr, :xmlDocPtr], :void
    attach_function :xmlSetNs, [:xmlNodePtr, :xmlNsPtr], :void
    attach_function :xmlSetNsProp, [:xmlNodePtr, :xmlNsPtr, :xmlCharPtr, :xmlCharPtr], :xmlAttrPtr
    attach_function :xmlSetProp, [:xmlNodePtr, :xmlCharPtr, :xmlCharPtr], :xmlAttrPtr
    attach_function :xmlSetTreeDoc, [:xmlNodePtr, :xmlDocPtr], :void
    attach_function :xmlSplitQName2, [:xmlCharPtr, :pointer], :xmlCharPtr
    attach_function :xmlSplitQName3, [:xmlCharPtr, :pointer], :xmlCharPtr
    attach_function :xmlStringGetNodeList, [:xmlDocPtr, :xmlCharPtr], :xmlNodePtr
    attach_function :xmlStringLenGetNodeList, [:xmlDocPtr, :xmlCharPtr, :int], :xmlNodePtr
    attach_function :xmlTextConcat, [:xmlNodePtr, :xmlCharPtr, :int], :int
    attach_function :xmlTextMerge, [:xmlNodePtr, :xmlNodePtr], :xmlNodePtr
    attach_function :xmlUnlinkNode, [:xmlNodePtr], :void
    attach_function :xmlUnsetNsProp, [:xmlNodePtr, :xmlNsPtr, :xmlCharPtr], :int
    attach_function :xmlUnsetProp, [:xmlNodePtr, :xmlCharPtr], :int
    attach_function :xmlValidateNCName, [:xmlCharPtr, :int], :int
    attach_function :xmlValidateNMToken, [:xmlCharPtr, :int], :int
    attach_function :xmlValidateName, [:xmlCharPtr, :int], :int
    attach_function :xmlValidateQName, [:xmlCharPtr, :int], :int

    # parser.h
    attach_variable :xmlParserVersion, :string
    attach_function :xmlByteConsumed, [:xmlParserCtxtPtr], :long
    attach_function :xmlCleanupParser, [], :void
    attach_function :xmlClearNodeInfoSeq, [:xmlParserNodeInfoSeqPtr], :void
    attach_function :xmlClearParserCtxt, [:xmlParserCtxtPtr], :void
    attach_function :xmlCreateDocParserCtxt, [:xmlCharPtr], :xmlParserCtxtPtr
    attach_function :xmlCreateIOParserCtxt, [:xmlSAXHandlerPtr, :pointer, :xmlInputReadCallback, :xmlInputCloseCallback, :pointer, :xmlCharEncoding], :xmlParserCtxtPtr
    attach_function :xmlCreatePushParserCtxt, [:xmlSAXHandlerPtr, :buffer_in, :string, :int, :string], :xmlParserCtxtPtr
    attach_function :xmlCtxtReadDoc, [:xmlParserCtxtPtr, :xmlCharPtr, :string, :string, :int], :xmlDocPtr
    attach_function :xmlCtxtReadFd, [:xmlParserCtxtPtr, :int, :string, :string, :int], :xmlDocPtr
    attach_function :xmlCtxtReadFile, [:xmlParserCtxtPtr, :string, :string, :int], :xmlDocPtr
    attach_function :xmlCtxtReadIO, [:xmlParserCtxtPtr, :xmlInputReadCallback, :xmlInputCloseCallback, :pointer, :string, :string, :int], :xmlDocPtr
    attach_function :xmlCtxtReadMemory, [:xmlParserCtxtPtr, :buffer_in, :int, :string, :string, :int], :xmlDocPtr
    attach_function :xmlCtxtReset, [:xmlParserCtxtPtr], :void
    attach_function :xmlCtxtResetPush, [:xmlParserCtxtPtr, :buffer_in, :int, :string, :string], :int
    attach_function :xmlCtxtUseOptions, [:xmlParserCtxtPtr, :int], :int
    attach_function :xmlFreeParserCtxt, [:xmlParserCtxtPtr], :void
    attach_function :xmlGetExternalEntityLoader, [], :xmlExternalEntityLoader
    attach_function :xmlGetFeature, [:xmlParserCtxtPtr, :string, :pointer], :int
    attach_function :xmlGetFeaturesList, [:pointer, :pointer], :int
    attach_function :xmlHasFeature, [:xmlFeature], :int
    attach_function :xmlIOParseDTD, [:xmlSAXHandlerPtr, :xmlParserInputBufferPtr, :xmlCharEncoding], :xmlDtdPtr
    attach_function :xmlInitNodeInfoSeq, [:xmlParserNodeInfoSeqPtr], :void
    attach_function :xmlInitParser, [], :void
    attach_function :xmlInitParserCtxt, [:xmlParserCtxtPtr], :int
    attach_function :xmlKeepBlanksDefault, [:int], :int
    attach_function :xmlLineNumbersDefault, [:int], :int
    attach_function :xmlLoadExternalEntity, [:string, :string, :xmlParserCtxtPtr], :xmlParserInputPtr
    attach_function :xmlNewIOInputStream, [:xmlParserCtxtPtr, :xmlParserInputBufferPtr, :xmlCharEncoding], :xmlParserInputPtr
    attach_function :xmlNewParserCtxt, [], :xmlParserCtxtPtr
    attach_function :xmlParseBalancedChunkMemory, [:xmlDocPtr, :xmlSAXHandlerPtr, :pointer, :int, :xmlCharPtr, :xmlNodePtr], :int
    attach_function :xmlParseBalancedChunkMemoryRecover, [:xmlDocPtr, :xmlSAXHandlerPtr, :pointer, :int, :xmlCharPtr, :xmlNodePtr, :int], :int
    attach_function :xmlParseChunk, [:xmlParserCtxtPtr, :buffer_in, :int, :int], :int
    attach_function :xmlParseCtxtExternalEntity, [:xmlParserCtxtPtr, :xmlCharPtr, :xmlCharPtr, :xmlNodePtr], :int
    attach_function :xmlParseDTD, [:xmlCharPtr, :xmlCharPtr], :xmlDtdPtr
    attach_function :xmlParseDoc, [:xmlCharPtr], :xmlDocPtr
    attach_function :xmlParseDocument, [:xmlParserCtxtPtr], :int
    attach_function :xmlParseEntity, [:string], :xmlDocPtr
    attach_function :xmlParseExtParsedEnt, [:xmlParserCtxtPtr], :int
    attach_function :xmlParseExternalEntity, [:xmlDocPtr, :xmlSAXHandlerPtr, :pointer, :int, :xmlCharPtr, :xmlCharPtr, :pointer], :int
    attach_function :xmlParseFile, [:string], :xmlDocPtr
    attach_function :xmlParseInNodeContext, [:xmlNodePtr, :buffer_in, :int, :int, :pointer], :xmlParserErrors
    attach_function :xmlParseMemory, [:buffer_in, :int], :xmlDocPtr
    attach_function :xmlParserAddNodeInfo, [:xmlParserCtxtPtr, :xmlParserNodeInfoPtr], :void
    attach_function :xmlParserFindNodeInfo, [:xmlParserCtxtPtr, :xmlNodePtr], :pointer
    attach_function :xmlParserFindNodeInfoIndex, [:xmlParserNodeInfoSeqPtr, :xmlNodePtr], :ulong
    attach_function :xmlParserInputGrow, [:xmlParserInputPtr, :int], :int
    attach_function :xmlParserInputRead, [:xmlParserInputPtr, :int], :int
    attach_function :xmlPedanticParserDefault, [:int], :int
    attach_function :xmlReadDoc, [:xmlCharPtr, :string, :string, :int], :xmlDocPtr
    attach_function :xmlReadFd, [:int, :string, :string, :int], :xmlDocPtr
    attach_function :xmlReadFile, [:string, :string, :int], :xmlDocPtr
    attach_function :xmlReadIO, [:xmlInputReadCallback, :xmlInputCloseCallback, :pointer, :string, :string, :int], :xmlDocPtr
    attach_function :xmlReadMemory, [:buffer_in, :int, :string, :string, :int], :xmlDocPtr
    attach_function :xmlRecoverDoc, [:xmlCharPtr], :xmlDocPtr
    attach_function :xmlRecoverFile, [:string], :xmlDocPtr
    attach_function :xmlRecoverMemory, [:buffer_in, :int], :xmlDocPtr
    attach_function :xmlSAXParseDTD, [:xmlSAXHandlerPtr, :xmlCharPtr, :xmlCharPtr], :xmlDtdPtr
    attach_function :xmlSAXParseDoc, [:xmlSAXHandlerPtr, :xmlCharPtr, :int], :xmlDocPtr
    attach_function :xmlSAXParseEntity, [:xmlSAXHandlerPtr, :string], :xmlDocPtr
    attach_function :xmlSAXParseFile, [:xmlSAXHandlerPtr, :string, :int], :xmlDocPtr
    attach_function :xmlSAXParseFileWithData, [:xmlSAXHandlerPtr, :string, :int, :pointer], :xmlDocPtr
    attach_function :xmlSAXParseMemory, [:xmlSAXHandlerPtr, :buffer_in, :int, :int], :xmlDocPtr
    attach_function :xmlSAXParseMemoryWithData, [:xmlSAXHandlerPtr, :buffer_in, :int, :int, :pointer], :xmlDocPtr
    attach_function :xmlSAXUserParseFile, [:xmlSAXHandlerPtr, :pointer, :string], :int
    attach_function :xmlSAXUserParseMemory, [:xmlSAXHandlerPtr, :pointer, :buffer_in, :int], :int
    attach_function :xmlSetExternalEntityLoader, [:xmlExternalEntityLoader], :void
    attach_function :xmlSetFeature, [:xmlParserCtxtPtr, :string, :pointer], :int
    attach_function :xmlSetupParserForBuffer, [:xmlParserCtxtPtr, :xmlCharPtr, :string], :void
    attach_function :xmlStopParser, [:xmlParserCtxtPtr], :void
    attach_function :xmlSubstituteEntitiesDefault, [:int], :int

    # xpath.h
    attach_function :xmlXPathCastBooleanToNumber, [:int], :double
    attach_function :xmlXPathCastBooleanToString, [:int], :xmlCharPtr
    attach_function :xmlXPathCastNodeSetToBoolean, [:xmlNodeSetPtr], :int
    attach_function :xmlXPathCastNodeSetToNumber, [:xmlNodeSetPtr], :double
    attach_function :xmlXPathCastNodeSetToString, [:xmlNodeSetPtr], :xmlCharPtr
    attach_function :xmlXPathCastNodeToNumber, [:xmlNodePtr], :double
    attach_function :xmlXPathCastNodeToString, [:xmlNodePtr], :xmlCharPtr
    attach_function :xmlXPathCastNumberToBoolean, [:double], :int
    attach_function :xmlXPathCastNumberToString, [:double], :xmlCharPtr
    attach_function :xmlXPathCastStringToBoolean, [:xmlCharPtr], :int
    attach_function :xmlXPathCastStringToNumber, [:xmlCharPtr], :double
    attach_function :xmlXPathCastToBoolean, [:xmlXPathObjectPtr], :int
    attach_function :xmlXPathCastToNumber, [:xmlXPathObjectPtr], :double
    attach_function :xmlXPathCastToString, [:xmlXPathObjectPtr], :xmlCharPtr
    attach_function :xmlXPathCmpNodes, [:xmlNodePtr, :xmlNodePtr], :int
    attach_function :xmlXPathCompile, [:xmlCharPtr], :xmlXPathCompExprPtr
    attach_function :xmlXPathCompiledEval, [:xmlXPathCompExprPtr, :xmlXPathContextPtr], :xmlXPathObjectPtr
    attach_function :xmlXPathCompiledEvalToBoolean, [:xmlXPathCompExprPtr, :xmlXPathContextPtr], :int
    attach_function :xmlXPathContextSetCache, [:xmlXPathContextPtr, :int, :int, :int], :int
    attach_function :xmlXPathConvertBoolean, [:xmlXPathObjectPtr], :xmlXPathObjectPtr
    attach_function :xmlXPathConvertNumber, [:xmlXPathObjectPtr], :xmlXPathObjectPtr
    attach_function :xmlXPathConvertString, [:xmlXPathObjectPtr], :xmlXPathObjectPtr
    attach_function :xmlXPathCtxtCompile, [:xmlXPathContextPtr, :xmlCharPtr], :xmlXPathCompExprPtr
    attach_function :xmlXPathEval, [:xmlCharPtr, :xmlXPathContextPtr], :xmlXPathObjectPtr
    attach_function :xmlXPathEvalExpression, [:xmlCharPtr, :xmlXPathContextPtr], :xmlXPathObjectPtr
    attach_function :xmlXPathEvalPredicate, [:xmlXPathContextPtr, :xmlXPathObjectPtr], :int
    attach_function :xmlXPathFreeCompExpr, [:xmlXPathCompExprPtr], :void
    attach_function :xmlXPathFreeContext, [:xmlXPathContextPtr], :void
    attach_function :xmlXPathFreeNodeSet, [:xmlNodeSetPtr], :void
    attach_function :xmlXPathFreeNodeSetList, [:xmlXPathObjectPtr], :void
    attach_function :xmlXPathFreeObject, [:xmlXPathObjectPtr], :void
    attach_function :xmlXPathInit, [], :void
    attach_function :xmlXPathIsInf, [:double], :int
    attach_function :xmlXPathIsNaN, [:double], :int
    attach_function :xmlXPathNewContext, [:xmlDocPtr], :xmlXPathContextPtr
    attach_function :xmlXPathNodeSetCreate, [:xmlNodePtr], :xmlNodeSetPtr
    attach_function :xmlXPathObjectCopy, [:xmlXPathObjectPtr], :xmlXPathObjectPtr
    attach_function :xmlXPathOrderDocElems, [:xmlDocPtr], :long

    def XML.init
      XML.xmlInitParser
    end

    def XML.is_xhtml?(system_id,public_id)
      case XML.xmlIsXHTML(system_id,public_id)
      when 1
        true
      when 0
        false
      else
        # TODO: raise error
      end
    end

    def XML.compression=(new_mode)
      XML.xmlSetCompressMode(new_mode)
    end
  end
end

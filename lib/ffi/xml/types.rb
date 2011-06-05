require 'ffi'

module FFI
  module XML
    extend FFI::Library

    typedef :uchar, :xmlChar
    typedef :pointer, :xmlCharPtr
    typedef :pointer, :xmlBufferPtr
    typedef :pointer, :xmlOutputBufferPtr
    typedef :pointer, :xmlParserCtxtPtr
    typedef :pointer, :xmlParserInputPtr
    typedef :pointer, :xmlParserInputBufferPtr
    typedef :pointer, :xmlParserNodeInfoPtr
    typedef :pointer, :xmlParserNodeInfoSeqPtr
    typedef :pointer, :xmlSAXHandlerPtr
    typedef :pointer, :xmlDocPtr
    typedef :pointer, :xmlDtdPtr
    typedef :pointer, :xmlDictPtr
    typedef :pointer, :xmlNsPtr
    typedef :pointer, :xmlNodePtr
    typedef :pointer, :xmlNodeSetPtr
    typedef :pointer, :xmlAttrPtr
    typedef :pointer, :xmlIDPtr

    typedef :pointer, :xmlBufferPtr
    typedef :pointer, :xmlDOMWrapCtxtPtr

    enum :xmlErrorLevel, [
      :none,    0,
      :warning, 1, # A simple warning
      :error,   2, # A recoverable error
      :fatal,   3  # A fatal error
    ]

    enum :xmlErrorDomain, [
      :parser,      # The XML parser
      :tree,        # The tree module
      :namespace,   # The XML Namespace module
      :dtd,         # The XML DTD validation with parser context
      :html,        # The HTML parser
      :memory,      # The memory allocator
      :output,      # The serialization code
      :io,          # The Input/Output stack
      :ftp,         # The FTP module
      :http,        # The HTTP module
      :xinclude,    # The XInclude processing
      :xpath,       # The XPath module
      :xpointer,    # The XPointer module
      :regexp,      # The regular expressions module
      :datatype,    # The W3C XML Schemas Datatype module
      :schemasp,    # The W3C XML Schemas parser module
      :schemasv,    # The W3C XML Schemas validation module
      :relaxngp,    # The Relax-NG parser module
      :relaxngv,    # The Relax-NG validator module
      :catalog,     # The Catalog module
      :c14n,        # The Canonicalization module
      :xslt,        # The XSLT engine from libxslt
      :valid,       # The XML DTD validation with valid context
      :check,       # The error checking module
      :writer,      # The xmlwriter module
      :module,      # The dynamically loaded module module
      :i18n,        # The module handling character conversion
      :schematronv  # The Schematron validator module
    ]

    enum :xmlParserErrors, [
      :err_ok, 0,
      :err_internal_error, # 1
      :err_no_memory, # 2
      :err_document_start, # 3
      :err_document_empty, # 4
      :err_document_end, # 5
      :err_invalid_hex_charref, # 6
      :err_invalid_dec_charref, # 7
      :err_invalid_charref, # 8
      :err_invalid_char, # 9
      :err_charref_at_eof, # 10
      :err_charref_in_prolog, # 11
      :err_charref_in_epilog, # 12
      :err_charref_in_dtd, # 13
      :err_entityref_at_eof, # 14
      :err_entityref_in_prolog, # 15
      :err_entityref_in_epilog, # 16
      :err_entityref_in_dtd, # 17
      :err_peref_at_eof, # 18
      :err_peref_in_prolog, # 19
      :err_peref_in_epilog, # 20
      :err_peref_in_int_subset, # 21
      :err_entityref_no_name, # 22
      :err_entityref_semicol_missing, # 23
      :err_peref_no_name, # 24
      :err_peref_semicol_missing, # 25
      :err_undeclared_entity, # 26
      :war_undeclared_entity, # 27
      :err_unparsed_entity, # 28
      :err_entity_is_external, # 29
      :err_entity_is_parameter, # 30
      :err_unknown_encoding, # 31
      :err_unsupported_encoding, # 32
      :err_string_not_started, # 33
      :err_string_not_closed, # 34
      :err_ns_decl_error, # 35
      :err_entity_not_started, # 36
      :err_entity_not_finished, # 37
      :err_lt_in_attribute, # 38
      :err_attribute_not_started, # 39
      :err_attribute_not_finished, # 40
      :err_attribute_without_value, # 41
      :err_attribute_redefined, # 42
      :err_literal_not_started, # 43
      :err_literal_not_finished, # 44
      :err_comment_not_finished, # 45
      :err_pi_not_started, # 46
      :err_pi_not_finished, # 47
      :err_notation_not_started, # 48
      :err_notation_not_finished, # 49
      :err_attlist_not_started, # 50
      :err_attlist_not_finished, # 51
      :err_mixed_not_started, # 52
      :err_mixed_not_finished, # 53
      :err_elemcontent_not_started, # 54
      :err_elemcontent_not_finished, # 55
      :err_xmldecl_not_started, # 56
      :err_xmldecl_not_finished, # 57
      :err_condsec_not_started, # 58
      :err_condsec_not_finished, # 59
      :err_ext_subset_not_finished, # 60
      :err_doctype_not_finished, # 61
      :err_misplaced_cdata_end, # 62
      :err_cdata_not_finished, # 63
      :err_reserved_xml_name, # 64
      :err_space_required, # 65
      :err_separator_required, # 66
      :err_nmtoken_required, # 67
      :err_name_required, # 68
      :err_pcdata_required, # 69
      :err_uri_required, # 70
      :err_pubid_required, # 71
      :err_lt_required, # 72
      :err_gt_required, # 73
      :err_ltslash_required, # 74
      :err_equal_required, # 75
      :err_tag_name_mismatch, # 76
      :err_tag_not_finished, # 77
      :err_standalone_value, # 78
      :err_encoding_name, # 79
      :err_hyphen_in_comment, # 80
      :err_invalid_encoding, # 81
      :err_ext_entity_standalone, # 82
      :err_condsec_invalid, # 83
      :err_value_required, # 84
      :err_not_well_balanced, # 85
      :err_extra_content, # 86
      :err_entity_char_error, # 87
      :err_entity_pe_internal, # 88
      :err_entity_loop, # 89
      :err_entity_boundary, # 90
      :err_invalid_uri, # 91
      :err_uri_fragment, # 92
      :war_catalog_pi, # 93
      :err_no_dtd, # 94
      :err_condsec_invalid_keyword, # 95
      :err_version_missing, # 96
      :war_unknown_version, # 97
      :war_lang_value, # 98
      :war_ns_uri, # 99
      :war_ns_uri_relative, # 100
      :err_missing_encoding, # 101
      :war_space_value, # 102
      :err_not_standalone, # 103
      :err_entity_processing, # 104
      :err_notation_processing, # 105
      :war_ns_column, # 106
      :war_entity_redefined, # 107
      :err_unknown_version, # 108
      :err_version_mismatch, # 109
      :ns_err_xml_namespace, 200,
      :ns_err_undefined_namespace, # 201
      :ns_err_qname, # 202
      :ns_err_attribute_redefined, # 203
      :ns_err_empty, # 204
      :ns_err_colon, # 205
      :dtd_attribute_default, 500,
      :dtd_attribute_redefined, # 501
      :dtd_attribute_value, # 502
      :dtd_content_error, # 503
      :dtd_content_model, # 504
      :dtd_content_not_determinist, # 505
      :dtd_different_prefix, # 506
      :dtd_elem_default_namespace, # 507
      :dtd_elem_namespace, # 508
      :dtd_elem_redefined, # 509
      :dtd_empty_notation, # 510
      :dtd_entity_type, # 511
      :dtd_id_fixed, # 512
      :dtd_id_redefined, # 513
      :dtd_id_subset, # 514
      :dtd_invalid_child, # 515
      :dtd_invalid_default, # 516
      :dtd_load_error, # 517
      :dtd_missing_attribute, # 518
      :dtd_mixed_corrupt, # 519
      :dtd_multiple_id, # 520
      :dtd_no_doc, # 521
      :dtd_no_dtd, # 522
      :dtd_no_elem_name, # 523
      :dtd_no_prefix, # 524
      :dtd_no_root, # 525
      :dtd_notation_redefined, # 526
      :dtd_notation_value, # 527
      :dtd_not_empty, # 528
      :dtd_not_pcdata, # 529
      :dtd_not_standalone, # 530
      :dtd_root_name, # 531
      :dtd_standalone_white_space, # 532
      :dtd_unknown_attribute, # 533
      :dtd_unknown_elem, # 534
      :dtd_unknown_entity, # 535
      :dtd_unknown_id, # 536
      :dtd_unknown_notation, # 537
      :dtd_standalone_defaulted, # 538
      :dtd_xmlid_value, # 539
      :dtd_xmlid_type, # 540
      :dtd_dup_token, # 541
      :html_strucure_error, 800,
      :html_unknown_tag, # 801
      :rngp_anyname_attr_ancestor, 1000,
      :rngp_attr_conflict, # 1001
      :rngp_attribute_children, # 1002
      :rngp_attribute_content, # 1003
      :rngp_attribute_empty, # 1004
      :rngp_attribute_noop, # 1005
      :rngp_choice_content, # 1006
      :rngp_choice_empty, # 1007
      :rngp_create_failure, # 1008
      :rngp_data_content, # 1009
      :rngp_def_choice_and_interleave, # 1010
      :rngp_define_create_failed, # 1011
      :rngp_define_empty, # 1012
      :rngp_define_missing, # 1013
      :rngp_define_name_missing, # 1014
      :rngp_elem_content_empty, # 1015
      :rngp_elem_content_error, # 1016
      :rngp_element_empty, # 1017
      :rngp_element_content, # 1018
      :rngp_element_name, # 1019
      :rngp_element_no_content, # 1020
      :rngp_elem_text_conflict, # 1021
      :rngp_empty, # 1022
      :rngp_empty_construct, # 1023
      :rngp_empty_content, # 1024
      :rngp_empty_not_empty, # 1025
      :rngp_error_type_lib, # 1026
      :rngp_except_empty, # 1027
      :rngp_except_missing, # 1028
      :rngp_except_multiple, # 1029
      :rngp_except_no_content, # 1030
      :rngp_externalref_emtpy, # 1031
      :rngp_external_ref_failure, # 1032
      :rngp_externalref_recurse, # 1033
      :rngp_forbidden_attribute, # 1034
      :rngp_foreign_element, # 1035
      :rngp_grammar_content, # 1036
      :rngp_grammar_empty, # 1037
      :rngp_grammar_missing, # 1038
      :rngp_grammar_no_start, # 1039
      :rngp_group_attr_conflict, # 1040
      :rngp_href_error, # 1041
      :rngp_include_empty, # 1042
      :rngp_include_failure, # 1043
      :rngp_include_recurse, # 1044
      :rngp_interleave_add, # 1045
      :rngp_interleave_create_failed, # 1046
      :rngp_interleave_empty, # 1047
      :rngp_interleave_no_content, # 1048
      :rngp_invalid_define_name, # 1049
      :rngp_invalid_uri, # 1050
      :rngp_invalid_value, # 1051
      :rngp_missing_href, # 1052
      :rngp_name_missing, # 1053
      :rngp_need_combine, # 1054
      :rngp_notallowed_not_empty, # 1055
      :rngp_nsname_attr_ancestor, # 1056
      :rngp_nsname_no_ns, # 1057
      :rngp_param_forbidden, # 1058
      :rngp_param_name_missing, # 1059
      :rngp_parentref_create_failed, # 1060
      :rngp_parentref_name_invalid, # 1061
      :rngp_parentref_no_name, # 1062
      :rngp_parentref_no_parent, # 1063
      :rngp_parentref_not_empty, # 1064
      :rngp_parse_error, # 1065
      :rngp_pat_anyname_except_anyname, # 1066
      :rngp_pat_attr_attr, # 1067
      :rngp_pat_attr_elem, # 1068
      :rngp_pat_data_except_attr, # 1069
      :rngp_pat_data_except_elem, # 1070
      :rngp_pat_data_except_empty, # 1071
      :rngp_pat_data_except_group, # 1072
      :rngp_pat_data_except_interleave, # 1073
      :rngp_pat_data_except_list, # 1074
      :rngp_pat_data_except_onemore, # 1075
      :rngp_pat_data_except_ref, # 1076
      :rngp_pat_data_except_text, # 1077
      :rngp_pat_list_attr, # 1078
      :rngp_pat_list_elem, # 1079
      :rngp_pat_list_interleave, # 1080
      :rngp_pat_list_list, # 1081
      :rngp_pat_list_ref, # 1082
      :rngp_pat_list_text, # 1083
      :rngp_pat_nsname_except_anyname, # 1084
      :rngp_pat_nsname_except_nsname, # 1085
      :rngp_pat_onemore_group_attr, # 1086
      :rngp_pat_onemore_interleave_attr, # 1087
      :rngp_pat_start_attr, # 1088
      :rngp_pat_start_data, # 1089
      :rngp_pat_start_empty, # 1090
      :rngp_pat_start_group, # 1091
      :rngp_pat_start_interleave, # 1092
      :rngp_pat_start_list, # 1093
      :rngp_pat_start_onemore, # 1094
      :rngp_pat_start_text, # 1095
      :rngp_pat_start_value, # 1096
      :rngp_prefix_undefined, # 1097
      :rngp_ref_create_failed, # 1098
      :rngp_ref_cycle, # 1099
      :rngp_ref_name_invalid, # 1100
      :rngp_ref_no_def, # 1101
      :rngp_ref_no_name, # 1102
      :rngp_ref_not_empty, # 1103
      :rngp_start_choice_and_interleave, # 1104
      :rngp_start_content, # 1105
      :rngp_start_empty, # 1106
      :rngp_start_missing, # 1107
      :rngp_text_expected, # 1108
      :rngp_text_has_child, # 1109
      :rngp_type_missing, # 1110
      :rngp_type_not_found, # 1111
      :rngp_type_value, # 1112
      :rngp_unknown_attribute, # 1113
      :rngp_unknown_combine, # 1114
      :rngp_unknown_construct, # 1115
      :rngp_unknown_type_lib, # 1116
      :rngp_uri_fragment, # 1117
      :rngp_uri_not_absolute, # 1118
      :rngp_value_empty, # 1119
      :rngp_value_no_content, # 1120
      :rngp_xmlns_name, # 1121
      :rngp_xml_ns, # 1122
      :xpath_expression_ok, 1200,
      :xpath_number_error, # 1201
      :xpath_unfinished_literal_error, # 1202
      :xpath_start_literal_error, # 1203
      :xpath_variable_ref_error, # 1204
      :xpath_undef_variable_error, # 1205
      :xpath_invalid_predicate_error, # 1206
      :xpath_expr_error, # 1207
      :xpath_unclosed_error, # 1208
      :xpath_unknown_func_error, # 1209
      :xpath_invalid_operand, # 1210
      :xpath_invalid_type, # 1211
      :xpath_invalid_arity, # 1212
      :xpath_invalid_ctxt_size, # 1213
      :xpath_invalid_ctxt_position, # 1214
      :xpath_memory_error, # 1215
      :xptr_syntax_error, # 1216
      :xptr_resource_error, # 1217
      :xptr_sub_resource_error, # 1218
      :xpath_undef_prefix_error, # 1219
      :xpath_encoding_error, # 1220
      :xpath_invalid_char_error, # 1221
      :tree_invalid_hex, 1300,
      :tree_invalid_dec, # 1301
      :tree_unterminated_entity, # 1302
      :tree_not_utf8, # 1303
      :save_not_utf8, 1400,
      :save_char_invalid, # 1401
      :save_no_doctype, # 1402
      :save_unknown_encoding, # 1403
      :regexp_compile_error, 1450,
      :io_unknown, 1500,
      :io_eacces, # 1501
      :io_eagain, # 1502
      :io_ebadf, # 1503
      :io_ebadmsg, # 1504
      :io_ebusy, # 1505
      :io_ecanceled, # 1506
      :io_echild, # 1507
      :io_edeadlk, # 1508
      :io_edom, # 1509
      :io_eexist, # 1510
      :io_efault, # 1511
      :io_efbig, # 1512
      :io_einprogress, # 1513
      :io_eintr, # 1514
      :io_einval, # 1515
      :io_eio, # 1516
      :io_eisdir, # 1517
      :io_emfile, # 1518
      :io_emlink, # 1519
      :io_emsgsize, # 1520
      :io_enametoolong, # 1521
      :io_enfile, # 1522
      :io_enodev, # 1523
      :io_enoent, # 1524
      :io_enoexec, # 1525
      :io_enolck, # 1526
      :io_enomem, # 1527
      :io_enospc, # 1528
      :io_enosys, # 1529
      :io_enotdir, # 1530
      :io_enotempty, # 1531
      :io_enotsup, # 1532
      :io_enotty, # 1533
      :io_enxio, # 1534
      :io_eperm, # 1535
      :io_epipe, # 1536
      :io_erange, # 1537
      :io_erofs, # 1538
      :io_espipe, # 1539
      :io_esrch, # 1540
      :io_etimedout, # 1541
      :io_exdev, # 1542
      :io_network_attempt, # 1543
      :io_encoder, # 1544
      :io_flush, # 1545
      :io_write, # 1546
      :io_no_input, # 1547
      :io_buffer_full, # 1548
      :io_load_error, # 1549
      :io_enotsock, # 1550
      :io_eisconn, # 1551
      :io_econnrefused, # 1552
      :io_enetunreach, # 1553
      :io_eaddrinuse, # 1554
      :io_ealready, # 1555
      :io_eafnosupport, # 1556
      :xinclude_recursion, 1600,
      :xinclude_parse_value, # 1601
      :xinclude_entity_def_mismatch, # 1602
      :xinclude_no_href, # 1603
      :xinclude_no_fallback, # 1604
      :xinclude_href_uri, # 1605
      :xinclude_text_fragment, # 1606
      :xinclude_text_document, # 1607
      :xinclude_invalid_char, # 1608
      :xinclude_build_failed, # 1609
      :xinclude_unknown_encoding, # 1610
      :xinclude_multiple_root, # 1611
      :xinclude_xptr_failed, # 1612
      :xinclude_xptr_result, # 1613
      :xinclude_include_in_include, # 1614
      :xinclude_fallbacks_in_include, # 1615
      :xinclude_fallback_not_in_include, # 1616
      :xinclude_deprecated_ns, # 1617
      :xinclude_fragment_id, # 1618
      :catalog_missing_attr, 1650,
      :catalog_entry_broken, # 1651
      :catalog_prefer_value, # 1652
      :catalog_not_catalog, # 1653
      :catalog_recursion, # 1654
      :schemap_prefix_undefined, 1700,
      :schemap_attrformdefault_value, # 1701
      :schemap_attrgrp_noname_noref, # 1702
      :schemap_attr_noname_noref, # 1703
      :schemap_complextype_noname_noref, # 1704
      :schemap_elemformdefault_value, # 1705
      :schemap_elem_noname_noref, # 1706
      :schemap_extension_no_base, # 1707
      :schemap_facet_no_value, # 1708
      :schemap_failed_build_import, # 1709
      :schemap_group_noname_noref, # 1710
      :schemap_import_namespace_not_uri, # 1711
      :schemap_import_redefine_nsname, # 1712
      :schemap_import_schema_not_uri, # 1713
      :schemap_invalid_boolean, # 1714
      :schemap_invalid_enum, # 1715
      :schemap_invalid_facet, # 1716
      :schemap_invalid_facet_value, # 1717
      :schemap_invalid_maxoccurs, # 1718
      :schemap_invalid_minoccurs, # 1719
      :schemap_invalid_ref_and_subtype, # 1720
      :schemap_invalid_white_space, # 1721
      :schemap_noattr_noref, # 1722
      :schemap_notation_no_name, # 1723
      :schemap_notype_noref, # 1724
      :schemap_ref_and_subtype, # 1725
      :schemap_restriction_noname_noref, # 1726
      :schemap_simpletype_noname, # 1727
      :schemap_type_and_subtype, # 1728
      :schemap_unknown_all_child, # 1729
      :schemap_unknown_anyattribute_child, # 1730
      :schemap_unknown_attr_child, # 1731
      :schemap_unknown_attrgrp_child, # 1732
      :schemap_unknown_attribute_group, # 1733
      :schemap_unknown_base_type, # 1734
      :schemap_unknown_choice_child, # 1735
      :schemap_unknown_complexcontent_child, # 1736
      :schemap_unknown_complextype_child, # 1737
      :schemap_unknown_elem_child, # 1738
      :schemap_unknown_extension_child, # 1739
      :schemap_unknown_facet_child, # 1740
      :schemap_unknown_facet_type, # 1741
      :schemap_unknown_group_child, # 1742
      :schemap_unknown_import_child, # 1743
      :schemap_unknown_list_child, # 1744
      :schemap_unknown_notation_child, # 1745
      :schemap_unknown_processcontent_child, # 1746
      :schemap_unknown_ref, # 1747
      :schemap_unknown_restriction_child, # 1748
      :schemap_unknown_schemas_child, # 1749
      :schemap_unknown_sequence_child, # 1750
      :schemap_unknown_simplecontent_child, # 1751
      :schemap_unknown_simpletype_child, # 1752
      :schemap_unknown_type, # 1753
      :schemap_unknown_union_child, # 1754
      :schemap_elem_default_fixed, # 1755
      :schemap_regexp_invalid, # 1756
      :schemap_failed_load, # 1757
      :schemap_nothing_to_parse, # 1758
      :schemap_noroot, # 1759
      :schemap_redefined_group, # 1760
      :schemap_redefined_type, # 1761
      :schemap_redefined_element, # 1762
      :schemap_redefined_attrgroup, # 1763
      :schemap_redefined_attr, # 1764
      :schemap_redefined_notation, # 1765
      :schemap_failed_parse, # 1766
      :schemap_unknown_prefix, # 1767
      :schemap_def_and_prefix, # 1768
      :schemap_unknown_include_child, # 1769
      :schemap_include_schema_not_uri, # 1770
      :schemap_include_schema_no_uri, # 1771
      :schemap_not_schema, # 1772
      :schemap_unknown_member_type, # 1773
      :schemap_invalid_attr_use, # 1774
      :schemap_recursive, # 1775
      :schemap_supernumerous_list_item_type, # 1776
      :schemap_invalid_attr_combination, # 1777
      :schemap_invalid_attr_inline_combination, # 1778
      :schemap_missing_simpletype_child, # 1779
      :schemap_invalid_attr_name, # 1780
      :schemap_ref_and_content, # 1781
      :schemap_ct_props_correct_1, # 1782
      :schemap_ct_props_correct_2, # 1783
      :schemap_ct_props_correct_3, # 1784
      :schemap_ct_props_correct_4, # 1785
      :schemap_ct_props_correct_5, # 1786
      :schemap_derivation_ok_restriction_1, # 1787
      :schemap_derivation_ok_restriction_2_1_1, # 1788
      :schemap_derivation_ok_restriction_2_1_2, # 1789
      :schemap_derivation_ok_restriction_2_2, # 1790
      :schemap_derivation_ok_restriction_3, # 1791
      :schemap_wildcard_invalid_ns_member, # 1792
      :schemap_intersection_not_expressible, # 1793
      :schemap_union_not_expressible, # 1794
      :schemap_src_import_3_1, # 1795
      :schemap_src_import_3_2, # 1796
      :schemap_derivation_ok_restriction_4_1, # 1797
      :schemap_derivation_ok_restriction_4_2, # 1798
      :schemap_derivation_ok_restriction_4_3, # 1799
      :schemap_cos_ct_extends_1_3, # 1800
      :schemav_noroot, 1801,
      :schemav_undeclaredelem, # 1802
      :schemav_nottoplevel, # 1803
      :schemav_missing, # 1804
      :schemav_wrongelem, # 1805
      :schemav_notype, # 1806
      :schemav_norollback, # 1807
      :schemav_isabstract, # 1808
      :schemav_notempty, # 1809
      :schemav_elemcont, # 1810
      :schemav_havedefault, # 1811
      :schemav_notnillable, # 1812
      :schemav_extracontent, # 1813
      :schemav_invalidattr, # 1814
      :schemav_invalidelem, # 1815
      :schemav_notdeterminist, # 1816
      :schemav_construct, # 1817
      :schemav_internal, # 1818
      :schemav_notsimple, # 1819
      :schemav_attrunknown, # 1820
      :schemav_attrinvalid, # 1821
      :schemav_value, # 1822
      :schemav_facet, # 1823
      :schemav_cvc_datatype_valid_1_2_1, # 1824
      :schemav_cvc_datatype_valid_1_2_2, # 1825
      :schemav_cvc_datatype_valid_1_2_3, # 1826
      :schemav_cvc_type_3_1_1, # 1827
      :schemav_cvc_type_3_1_2, # 1828
      :schemav_cvc_facet_valid, # 1829
      :schemav_cvc_length_valid, # 1830
      :schemav_cvc_minlength_valid, # 1831
      :schemav_cvc_maxlength_valid, # 1832
      :schemav_cvc_mininclusive_valid, # 1833
      :schemav_cvc_maxinclusive_valid, # 1834
      :schemav_cvc_minexclusive_valid, # 1835
      :schemav_cvc_maxexclusive_valid, # 1836
      :schemav_cvc_totaldigits_valid, # 1837
      :schemav_cvc_fractiondigits_valid, # 1838
      :schemav_cvc_pattern_valid, # 1839
      :schemav_cvc_enumeration_valid, # 1840
      :schemav_cvc_complex_type_2_1, # 1841
      :schemav_cvc_complex_type_2_2, # 1842
      :schemav_cvc_complex_type_2_3, # 1843
      :schemav_cvc_complex_type_2_4, # 1844
      :schemav_cvc_elt_1, # 1845
      :schemav_cvc_elt_2, # 1846
      :schemav_cvc_elt_3_1, # 1847
      :schemav_cvc_elt_3_2_1, # 1848
      :schemav_cvc_elt_3_2_2, # 1849
      :schemav_cvc_elt_4_1, # 1850
      :schemav_cvc_elt_4_2, # 1851
      :schemav_cvc_elt_4_3, # 1852
      :schemav_cvc_elt_5_1_1, # 1853
      :schemav_cvc_elt_5_1_2, # 1854
      :schemav_cvc_elt_5_2_1, # 1855
      :schemav_cvc_elt_5_2_2_1, # 1856
      :schemav_cvc_elt_5_2_2_2_1, # 1857
      :schemav_cvc_elt_5_2_2_2_2, # 1858
      :schemav_cvc_elt_6, # 1859
      :schemav_cvc_elt_7, # 1860
      :schemav_cvc_attribute_1, # 1861
      :schemav_cvc_attribute_2, # 1862
      :schemav_cvc_attribute_3, # 1863
      :schemav_cvc_attribute_4, # 1864
      :schemav_cvc_complex_type_3_1, # 1865
      :schemav_cvc_complex_type_3_2_1, # 1866
      :schemav_cvc_complex_type_3_2_2, # 1867
      :schemav_cvc_complex_type_4, # 1868
      :schemav_cvc_complex_type_5_1, # 1869
      :schemav_cvc_complex_type_5_2, # 1870
      :schemav_element_content, # 1871
      :schemav_document_element_missing, # 1872
      :schemav_cvc_complex_type_1, # 1873
      :schemav_cvc_au, # 1874
      :schemav_cvc_type_1, # 1875
      :schemav_cvc_type_2, # 1876
      :schemav_cvc_idc, # 1877
      :schemav_cvc_wildcard, # 1878
      :schemav_misc, # 1879
      :xptr_unknown_scheme, 1900,
      :xptr_childseq_start, # 1901
      :xptr_eval_failed, # 1902
      :xptr_extra_objects, # 1903
      :c14n_create_ctxt, 1950,
      :c14n_requires_utf8, # 1951
      :c14n_create_stack, # 1952
      :c14n_invalid_node, # 1953
      :c14n_unknow_node, # 1954
      :c14n_relative_namespace, # 1955
      :ftp_pasv_answer, 2000,
      :ftp_epsv_answer, # 2001
      :ftp_accnt, # 2002
      :ftp_url_syntax, # 2003
      :http_url_syntax, 2020,
      :http_use_ip, # 2021
      :http_unknown_host, # 2022
      :schemap_src_simple_type_1, 3000,
      :schemap_src_simple_type_2, # 3001
      :schemap_src_simple_type_3, # 3002
      :schemap_src_simple_type_4, # 3003
      :schemap_src_resolve, # 3004
      :schemap_src_restriction_base_or_simpletype, # 3005
      :schemap_src_list_itemtype_or_simpletype, # 3006
      :schemap_src_union_membertypes_or_simpletypes, # 3007
      :schemap_st_props_correct_1, # 3008
      :schemap_st_props_correct_2, # 3009
      :schemap_st_props_correct_3, # 3010
      :schemap_cos_st_restricts_1_1, # 3011
      :schemap_cos_st_restricts_1_2, # 3012
      :schemap_cos_st_restricts_1_3_1, # 3013
      :schemap_cos_st_restricts_1_3_2, # 3014
      :schemap_cos_st_restricts_2_1, # 3015
      :schemap_cos_st_restricts_2_3_1_1, # 3016
      :schemap_cos_st_restricts_2_3_1_2, # 3017
      :schemap_cos_st_restricts_2_3_2_1, # 3018
      :schemap_cos_st_restricts_2_3_2_2, # 3019
      :schemap_cos_st_restricts_2_3_2_3, # 3020
      :schemap_cos_st_restricts_2_3_2_4, # 3021
      :schemap_cos_st_restricts_2_3_2_5, # 3022
      :schemap_cos_st_restricts_3_1, # 3023
      :schemap_cos_st_restricts_3_3_1, # 3024
      :schemap_cos_st_restricts_3_3_1_2, # 3025
      :schemap_cos_st_restricts_3_3_2_2, # 3026
      :schemap_cos_st_restricts_3_3_2_1, # 3027
      :schemap_cos_st_restricts_3_3_2_3, # 3028
      :schemap_cos_st_restricts_3_3_2_4, # 3029
      :schemap_cos_st_restricts_3_3_2_5, # 3030
      :schemap_cos_st_derived_ok_2_1, # 3031
      :schemap_cos_st_derived_ok_2_2, # 3032
      :schemap_s4s_elem_not_allowed, # 3033
      :schemap_s4s_elem_missing, # 3034
      :schemap_s4s_attr_not_allowed, # 3035
      :schemap_s4s_attr_missing, # 3036
      :schemap_s4s_attr_invalid_value, # 3037
      :schemap_src_element_1, # 3038
      :schemap_src_element_2_1, # 3039
      :schemap_src_element_2_2, # 3040
      :schemap_src_element_3, # 3041
      :schemap_p_props_correct_1, # 3042
      :schemap_p_props_correct_2_1, # 3043
      :schemap_p_props_correct_2_2, # 3044
      :schemap_e_props_correct_2, # 3045
      :schemap_e_props_correct_3, # 3046
      :schemap_e_props_correct_4, # 3047
      :schemap_e_props_correct_5, # 3048
      :schemap_e_props_correct_6, # 3049
      :schemap_src_include, # 3050
      :schemap_src_attribute_1, # 3051
      :schemap_src_attribute_2, # 3052
      :schemap_src_attribute_3_1, # 3053
      :schemap_src_attribute_3_2, # 3054
      :schemap_src_attribute_4, # 3055
      :schemap_no_xmlns, # 3056
      :schemap_no_xsi, # 3057
      :schemap_cos_valid_default_1, # 3058
      :schemap_cos_valid_default_2_1, # 3059
      :schemap_cos_valid_default_2_2_1, # 3060
      :schemap_cos_valid_default_2_2_2, # 3061
      :schemap_cvc_simple_type, # 3062
      :schemap_cos_ct_extends_1_1, # 3063
      :schemap_src_import_1_1, # 3064
      :schemap_src_import_1_2, # 3065
      :schemap_src_import_2, # 3066
      :schemap_src_import_2_1, # 3067
      :schemap_src_import_2_2, # 3068
      :schemap_internal, # 3069 non-w3c
      :schemap_not_deterministic, # 3070 non-w3c
      :schemap_src_attribute_group_1, # 3071
      :schemap_src_attribute_group_2, # 3072
      :schemap_src_attribute_group_3, # 3073
      :schemap_mg_props_correct_1, # 3074
      :schemap_mg_props_correct_2, # 3075
      :schemap_src_ct_1, # 3076
      :schemap_derivation_ok_restriction_2_1_3, # 3077
      :schemap_au_props_correct_2, # 3078
      :schemap_a_props_correct_2, # 3079
      :schemap_c_props_correct, # 3080
      :schemap_src_redefine, # 3081
      :schemap_src_import, # 3082
      :schemap_warn_skip_schema, # 3083
      :schemap_warn_unlocated_schema, # 3084
      :schemap_warn_attr_redecl_proh, # 3085
      :schemap_warn_attr_pointless_proh, # 3085
      :schemap_ag_props_correct, # 3086
      :schemap_cos_ct_extends_1_2, # 3087
      :schemap_au_props_correct, # 3088
      :schemap_a_props_correct_3, # 3089
      :schemap_cos_all_limited, # 3090
      :schematronv_assert, 4000, # 4000
      :schematronv_report,
      :module_open, 4900, # 4900
      :module_close, # 4901
      :check_found_element, 5000,
      :check_found_attribute, # 5001
      :check_found_text, # 5002
      :check_found_cdata, # 5003
      :check_found_entityref, # 5004
      :check_found_entity, # 5005
      :check_found_pi, # 5006
      :check_found_comment, # 5007
      :check_found_doctype, # 5008
      :check_found_fragment, # 5009
      :check_found_notation, # 5010
      :check_unknown_node, # 5011
      :check_entity_type, # 5012
      :check_no_parent, # 5013
      :check_no_doc, # 5014
      :check_no_name, # 5015
      :check_no_elem, # 5016
      :check_wrong_doc, # 5017
      :check_no_prev, # 5018
      :check_wrong_prev, # 5019
      :check_no_next, # 5020
      :check_wrong_next, # 5021
      :check_not_dtd, # 5022
      :check_not_attr, # 5023
      :check_not_attr_decl, # 5024
      :check_not_elem_decl, # 5025
      :check_not_entity_decl, # 5026
      :check_not_ns_decl, # 5027
      :check_no_href, # 5028
      :check_wrong_parent,# 5029
      :check_ns_scope, # 5030
      :check_ns_ancestor, # 5031
      :check_not_utf8, # 5032
      :check_no_dict, # 5033
      :check_not_ncname, # 5034
      :check_outside_dict, # 5035
      :check_wrong_name, # 5036
      :check_name_not_null, # 5037
      :i18n_no_name, 6000,
      :i18n_no_handler, # 6001
      :i18n_excess_handler, # 6002
      :i18n_conv_failed, # 6003
      :i18n_no_output, # 6004
      :check_, # 5033
      :check_x # 503
    ]

    enum :xmlCharEncoding, [
      :ERROR,     -1, # No char encoding detected
      :NONE,      0,  # No char encoding detected
      :UTF8,      1,  # UTF-8
      :UTF16LE,   2,  # UTF-16 little endian
      :UTF16BE,   3,  # UTF-16 big endian
      :UCS4LE,    4,  # UCS-4 little endian
      :UCS4BE,    5,  # UCS-4 big endian
      :EBCDIC,    6,  # EBCDIC uh!
      :UCS4_2143, 7,  # UCS-4 unusual ordering
      :UCS4_3412, 8,  # UCS-4 unusual ordering
      :UCS2,      9,  # UCS-2
      :"8859_1",  10, # ISO-8859-1 ISO Latin 1
      :"8859_2",  11, # ISO-8859-2 ISO Latin 2
      :"8859_3",  12, # ISO-8859-3
      :"8859_4",  13, # ISO-8859-4
      :"8859_5",  14, # ISO-8859-5
      :"8859_6",  15, # ISO-8859-6
      :"8859_7",  16, # ISO-8859-7
      :"8859_8",  17, # ISO-8859-8
      :"8859_9",  18, # ISO-8859-9
      :"2022_JP", 19, # ISO-2022-JP
      :SHIFT_JIS, 20, # Shift_JIS
      :EUC_JP,    21, # EUC-JP
      :ASCII,     22, # pure ASCII
    ]

    enum :xmlParserInputState, [
      :eof, -1,	        # nothing is to be parsed
      :start, 0,	      # nothing has been parsed
      :misc,		        # Misc* before int subset
      :pi,		          # Within a processing instruction
      :dtd,		          # within some DTD content
      :prolog,		      # Misc* after internal subset
      :comment,		      # within a comment
      :start_tag,	      # within a start tag
      :content,		      # within the content
      :cdata_section,	  # within a CDATA section
      :end_tag,		      # within a closing tag
      :entity_decl,	    # within an entity declaration
      :entity_value,	  # within an entity value in a decl
      :attribute_value,	# within an attribute value
      :system_literal,	# within a SYSTEM value
      :epilog, 		      # the Misc* after the last end tag
      :ignore,		      # within an IGNORED section
      :public_literal 	# within a PUBLIC value
    ]

    enum :xmlParserMode, [
      :unknown,  0,
      :dom,      1,
      :sax,      2,
      :push_dom, 3,
      :push_sax, 4,
      :reader,   5
    ]

    enum :xmlParserOption, [
      :RECOVER,    1 << 0,  # recover on errors
      :NOENT,      1 << 1,  # substitute entities
      :DTDLOAD,    1 << 2,  # load the external subset
      :DTDATTR,    1 << 3,  # default DTD attributes
      :DTDVALID,   1 << 4,  # validate with the DTD
      :NOERROR,    1 << 5,  # suppress error reports
      :NOWARNING,  1 << 6,	# suppress warning reports
      :PEDANTIC,   1 << 7,  # pedantic error reporting
      :NOBLANKS,   1 << 8,  # remove blank nodes
      :SAX1,       1 << 9,	# use the SAX1 interface internally
      :XINCLUDE,   1 << 10, # Implement XInclude substitition
      :NONET,      1 << 11, # Forbid network access
      :NODICT,     1 << 12, # Do not reuse the context dictionnary
      :NSCLEAN,    1 << 13, # remove redundant namespaces declarations
      :NOCDATA,    1 << 14, # merge CDATA as text nodes
      :NOXINCNODE, 1 << 15, # do not generate XINCLUDE START/END nodes
      :COMPACT,    1 << 16, # compact small text nodes; no modification of
                          # the tree allowed afterwards (will possibly
                          # crash if you try to modify the tree)
      :OLD10,      1 << 17, # parse using XML-1.0 before update 5
      :NOBASEFIX,  1 << 18, # do not fixup XINCLUDE xml:base uris
      :HUGE,       1 << 19, # relax any hardcoded limit from the parser
      :OLDSAX,     1 << 20  # parse using SAX2 interface from before 2.7.0
    ]

    enum :xmlFeature, [
      :with_thread,     1,
      :with_tree,       2,
      :with_output,     3,
      :with_push,       4,
      :with_reader,     5,
      :with_pattern,    6,
      :with_writer,     7,
      :with_sax1,       8,
      :with_ftp,        9,
      :with_http,       10,
      :with_valid,      11,
      :with_html,       12,
      :with_legacy,     13,
      :with_c14n,       14,
      :with_catalog,    15,
      :with_xpath,      16,
      :with_xptr,       17,
      :with_xinclude,   18,
      :with_iconv,      19,
      :with_iso8859x,   20,
      :with_unicode,    21,
      :with_regexp,     22,
      :with_automata,   23,
      :with_expr,       24,
      :with_schemas,    25,
      :with_schematron, 26,
      :with_modules,    27,
      :with_debug,      28,
      :with_debug_mem,  29,
      :with_debug_run,  30,
      :with_zlib,       31,
      :with_none,       99999 # just to be sure of allocation size 
    ]

    enum :xmlBufferAllocationScheme, [
      :doubleit,   # double each time one need to grow
      :exact,      # grow only to the minimal size
      :immutable,  # immutable buffer
      :io          # special allocation scheme used for I/O
    ]

    enum :xmlDocProperties, [
      :wellformed, 1 << 0, # document is XML well formed
      :nsvalid,    1 << 1, # document is Namespace valid
      :old10,      1 << 2, # parsed with old XML-1.0 parser
      :dtdvalid,   1 << 3, # DTD validation was successful
      :xinclude,   1 << 4, # XInclude substitution was done
      :userbuilt,  1 << 5, # Document was built using the API
                           # and not by parsing an instance
      :INTERNAL,   1 << 6, # built for internal processing
      :HTML,       1 << 7  # parsed or built HTML document
    ]

    enum :xmlElementType, [
      :element_node,       1,
      :attribute_node,     2,
      :text_node,          3,
      :cdata_section_node, 4,
      :entity_ref_node,    5,
      :entity_node,        6,
      :pi_node,            7,
      :comment_node,       8,
      :document_node,      9,
      :document_type_node, 10,
      :document_frag_node, 11,
      :notation_node,      12,
      :html_document_node, 13,
      :dtd_node,           14,
      :element_decl,       15,
      :attribute_decl,     16,
      :entity_decl,        17,
      :namespace_decl,     18,
      :xinclude_start,     19,
      :xinclude_end,       20,
      :docb_document_node, 21
    ]

    enum :xmlElementContentType, [
      :pcdata, 1,
      :element,
      :seq,
      :or
    ]

    enum :xmlElementContentOccur, [
      :once, 1,
      :opt,
      :mult,
      :plus
    ]

    enum :xmlElementTypeVal, [
      :undefined, 0,
      :empty,     1,
      :any,
      :mixed,
      :element
    ]

    typedef :xmlElementType, :xmlNsType

    enum :xmlAttributeType, [
      :cdata, 1,
      :id,
      :idref ,
      :idrefs,
      :entity,
      :entities,
      :nmtoken,
      :nmtokens,
      :enumeration,
      :notation
    ]

    enum :xmlAttributeDefault, [
      :none, 1,
      :required,
      :implied,
      :fixed
    ]

    callback :xmlInputReadCallback, [:pointer, :buffer_out, :int], :int
    callback :xmlInputCloseCallback, [:pointer], :int
    callback :xmlExternalEntityLoader, [:string, :string, :xmlParserCtxtPtr], :xmlParserInputPtr
    callback :xmlDOMWrapAcquireNsFunction, [:xmlDOMWrapCtxtPtr, :xmlNodePtr, :xmlCharPtr, :xmlCharPtr], :xmlNsPtr
  end
end

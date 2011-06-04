# ffi-xml

* [Source](http://github.com/postmodern/ffi-xml)
* [Issues](http://github.com/postmodern/ffi-xml/issues)
* [Documentation](http://rubydoc.info/gems/ffi-xml/frames)
* [Email](mailto:postmodern.mod3 at gmail.com)

## Description

FFI bindings to [libxml2](http://xmlsoft.org/).

## Features

* Pure-Ruby bindings to libxml2.
* Provides low-level access to the libxml2 API.
* No compilers or headers files need.

## Examples

    require 'ffi/xml'

    doc = FFI::XML::Doc.parse_file('test.xml')

    doc.xpath('//a//c')

## Requirements

* [libxml2](http://xmlsoft.org/) >= 2.0.0
* [ffi](http://github.com/ffi/ffi) ~> 1.0

## Install

    $ gem install ffi-xml

## Copyright

Copyright (c) 2011 Hal Brodigan

See {file:LICENSE.txt} for details.

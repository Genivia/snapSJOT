
[![logo][logo-url]][sjot-url]

[![npm version][npm-image]][npm-url] [![build status][travis-image]][travis-url] [![license][bsd-3-image]][bsd-3-url]

snapSJOT 
========

Creates SJOT schemas from JSON data, a companion module for SJOT schemas
[sjot.org](http://sjot.org) npm package
[sjot.js](https://www.npmjs.com/package/sjot) GitHub repository
[Genivia/SJOT](https://github.com/Genivia/SJOT).

[Live demo](https://www.genivia.com/get-sjot.html#demo) SJOT validator, schema
converters and snapSJOT creator.

Installation
------------

    npm install snapsjot

How to snapSJOT JSON
--------------------

`snapSJOT.convert(data)` returns a SJOT schema for the given JSON or JS value.
Use snapSJOT with node.js as follows:

```js
var snapSJOT = require("snapsjot");
var data =
[
  {
    "name":    "SJOT",
    "v":       "1.3.7",
    "tags":    [ "JSON", "SJOT", "validator" ],
    "package": { "id": 1, "name": "sjot" }
  },
  {
    "name":    "SNAPSJOT",
    "v":       1.3,
    "tags":    [ "JSON", "SJOT", "converter" ],
    "package": { "id": 2, "name": "snapsjot", "opt": true }
  }
];
var schema = snapSJOT.convert(data);
console.log(JSON.stringify(schema, null, 2));
```

This creates and displays the following SJOT schema:

```js
{
  "@note": "SJOT schema created from JSON data by snapSJOT",
  "@root": [
    {
      "@final": true,
      "name": "string",
      "v": [[ "string", "number" ]],
      "tags": [ "string" ],
      "package": {
        "@final": true,
        "id": "number",
        "name": "string",
        "opt?": "boolean"
      }
    }
  ]
}
```

where `@root` specifies that the root type of the JSON data is an array of
objects, `@final` means that the object is not extensible (remove if
    extensibility is desired), the `"string"` type matches any string, the
`"number"` type matches any number and the `"boolean"` type matches `true` or
`false`.  These types can be further restricted as specified by [SJOT
schema](http://sjot.org) syntax.  The `[[ "string", "number" ]]` with
`"string"` and `"number"` types is a type choice that matches any string or
number.  An object property name ending in a `?` is optional.

To validate JSON or type check JS values with SJOT schemas, use the SJOT
validator by installing npm package [sjot](https://www.npmjs.com/package/sjot):

    npm install sjot

and use `SJOT.valid(data, "@root", schema)` to validate `data` against a SJOT
`schema`:

```js
var SJOT = require("sjot");

var schema = ...; // SJOT schema (e.g. generated with snapSJOT)

var data = ...;   // some data to validate (or type check)

if (SJOT.valid(data, "@root", schema))
  ... // OK: data validated against schema
```

Because snapSJOT generates only one root type, you can simply pass the root
type to `SJOT.valid()` to type-check the data as follows:

```js
var type = schema["@root"]; // just use the SJOT root type

if (SJOT.valid(data, type))
  ... // OK: data type-checked
```

How to contribute?
------------------

We love feedback and contributions to this project.  Please read
[CONTRIBUTING](CONTRIBUTING.md) for details.

Changelog
---------

- Nov 14, 2017: snapsjot 1.3.17 added snapSJOT snapsjot.js schema creator to convert JSON data to SJOT schemas
- Nov 15, 2017: snapsjot 1.3.18 fixed index.js
- Nov 16, 2017: snapsjot 1.4.0  updates
- Nov 18, 2017: snapsjot 1.4.1  minor updates

[logo-url]: https://www.genivia.com/images/sjot-logo.png
[sjot-url]: http://sjot.org
[npm-image]: https://badge.fury.io/js/snapsjot.svg
[npm-url]: https://www.npmjs.com/package/snapsjot
[travis-image]: https://travis-ci.com/Genivia/snapSJOT.svg?branch=master
[travis-url]: https://travis-ci.com/Genivia/snapSJOT
[bsd-3-image]: https://img.shields.io/badge/license-BSD%203--Clause-blue.svg
[bsd-3-url]: https://opensource.org/licenses/BSD-3-Clause

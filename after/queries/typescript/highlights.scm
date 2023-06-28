;;extends

"export" @keyword.export
"from" @keyword

(string_fragment) @string.fragment
(true) @boolean.true
(false) @boolean.false

(import_clause 
  [
    (identifier) @include.identifier
    (named_imports (import_specifier 
      [
        name: (identifier) @include.identifier
        alias: (identifier) @include.identifier
      ]
    ))
    (namespace_import (identifier) @include.identifier)
  ]
)

(object (pair key: (property_identifier) @object.key (#set! "priority" 1000)))
(call_expression function: (identifier) @function.call (#set! "priority" 1000))
(arguments (identifier) @variable (#set! "priority" 1000))
(object_type (property_signature name: (property_identifier) @property (#set! "priority" 1000)))

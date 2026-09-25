(open
  namespace: (identifier) @namespace)
(namespace
  name: (identifier) @namespace)
(section
  name: (identifier) @namespace)

;; Declarations

[
  "abbrev"
  "def"
  "theorem"
  "constant"
  "instance"
  "axiom"
  "example"
  "inductive"
  "structure"
  "class"

  "deriving"

  "section"
  "namespace"
] @keyword

(attributes
  (identifier) @function)

(abbrev
  name: (identifier) @type)
(def
  name: (identifier) @function)
(def
  type: (identifier) @type)
(def
  type: (app
    fn: (identifier) @type
    arg: (identifier) @type))
(theorem
  name: (identifier) @function)
(theorem
  type: (identifier) @type)
(theorem
  type: (app
    fn: (identifier) @type
    arg: (identifier) @type))
(constant
  name: (identifier) @type)
(instance
  name: (identifier) @function)
(instance
  type: (identifier) @type)
(axiom
  name: (identifier) @function)
(structure
  name: (identifier) @type)
(implicit_binder
    type: (identifier) @type)
(explicit_binder
    type: (identifier) @type)

;; Applied type expressions (for example `Option Foo` or `Array Pixel`)
;; are represented as an `app` node, so the bare-identifier rule above
;; only highlights the atomic type case.
(implicit_binder
  type: (app
    fn: (identifier) @type
    arg: (identifier) @type))
(explicit_binder
  type: (app
    fn: (identifier) @type
    arg: (identifier) @type))

;; Function types are right-associated binary operators. Highlight each
;; named type leaf in the binder's arrow chain.
(explicit_binder
  type: (binary_op
    lhs: (identifier) @type))
(explicit_binder
  type: (binary_op
    rhs: (identifier) @type))
(explicit_binder
  type: (binary_op
    lhs: (app
      fn: (identifier) @type
      arg: (identifier) @type)))
(explicit_binder
  type: (binary_op
    rhs: (app
      fn: (identifier) @type
      arg: (identifier) @type)))
(explicit_binder
  type: (binary_op
    rhs: (binary_op
      lhs: (identifier) @type
      rhs: (identifier) @type)))

;; Binder names are values in scope, while their annotations are types.
(implicit_binder
  name: (identifier) @variable)
(explicit_binder
  name: (identifier) @variable)

;; Local names, including mutable bindings, share the `let` node.
(let
  name: (identifier) @variable)
(block_assign
  name: (identifier) @variable)

(proj
  field: (identifier) @field)

["if" "then" "else"] @conditional

["for" "in" "do"] @repeat

(import
  name: (identifier) @module)

; Tokens

[
  "→" "->" "↔" "<->" "↦" "=>"
  "∨" "||" "∧" "&&" "¬" "!"
  "=" "≠" "!=" "<" "≤" "<=" ">" "≥" ">="
  "∈" "∉" "⊆" "⊂" "⊇" "⊃"
  "≡" "≢" "~" "≃" "≅"
  "::" "++"
  "+" "-" "*" "/" "%"
  "∪" "∩" "\\"
  "^" "∘"
  "|>" "<|"
  ">>" "<<" ">>>" "<<<"
  ">>=" "=<<"
  "<$>" "<*>" "<|>" "<&>"
  "&&&" "|||" "^^^"
  "←" "<-"
] @operator

[
 "import"
] @keyword.import

[
  "attribute"
  "by"
  "end"
  "export"
  "extends"
  "fun"
  "let"
  "have"
  "match"
  "open"
  "return"
  "universe"
  "variable"
  "where"
  "with"
  "λ"
  (prelude)
  (sorry)
] @keyword

[
  "prefix"
  "infix"
  "infixl"
  "infixr"
  "postfix"
  "notation"
  "macro"
  "macro_rules"
  "syntax"
  "builtin_initialize"
] @keyword

[
  "noncomputable"
  "partial"
  "private"
  "protected"
  "unsafe"
] @keyword.modifier

((app
  fn: (identifier) @exception)
 (#match? @exception "throw"))

[(true_const) (false_const)] @boolean

(num_lit) @number
(scientific_lit) @number.float

(line_comment) @comment
(block_comment) @comment
(doc_comment) @comment.documentation
(module_doc_comment) @comment.documentation
(char_lit) @character
(str_lit) @string
(interpolated_str) @string
(escape_sequence) @string.escape

[
  "(" ")"
  "[" "]"
  "{" "}"
  "⟨" "⟩"
] @punctuation.bracket

["|" "," "." ":" ";"] @punctuation.delimiter

(sorry) @error

;; Error
(ERROR) @error

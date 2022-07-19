type Variable* = ref object
  name: string
  variableType: string
  value: string

type Syntax* = ref object
  syntaxType: string
  variable: Variable

type Node* = ref object
  parentId: string
  childId: string
  syntax: Syntax
  originalCode: string

type Ast* = seq[Node]

type Sentence* = string

type Lexer* = ref object
  separators = a

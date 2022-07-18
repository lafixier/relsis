type Variable = ref object
  name: string
  variableType: string
  value: string

type Syntax = ref object
  syntaxType: string
  variable: Variable

type Ast* = ref object
  parentId: string
  childId: string
  syntax: Syntax
  originalCode: string

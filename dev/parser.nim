import types


proc parse* (tokens: seq[string]): Ast =
  Ast()

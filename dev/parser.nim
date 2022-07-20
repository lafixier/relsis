import types


type Parser* = ref object
  tokens: seq[string]
  ast: Ast
  sentences: seq[Sentence]

proc init(parser: Parser) =
  parser.tokens = @[]
  parser.ast = @[]
  parser.sentences = @[]

proc divideIntoSentences(parser: Parser) =
  for token in parser.tokens:
    echo token


proc parse*(parser: Parser, tokens: seq[string]): Ast =
  parser.init()
  parser.tokens = tokens
  parser.divideIntoSentences()
  return parser.ast

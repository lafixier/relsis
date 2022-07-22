type Lexer* = ref object
  src: string
  separators: array[0..10, char]
  skippedCharacters: array[0..0, char]
  tokens: seq[string]
  isInQuotes: bool
  token: string

proc init(lexer: Lexer) =
  lexer.separators = [' ', '\n', '.', '(', ')', '{', '}', '\'', '\"', '=', ':']
  lexer.skippedCharacters = [' ']
  lexer.tokens = @[]
  lexer.token = ""
  lexer.isInQuotes = false
  lexer.src = ""

proc lex*(lexer: Lexer, src: string): seq[string] =
  lexer.init()
  lexer.src = src
  for i, character in lexer.src:
    if character == '"':
      if lexer.isInQuotes:
        lexer.isInQuotes = false
        lexer.token = lexer.token & character
        lexer.tokens.add(lexer.token)
        lexer.token = ""
        continue
      else:
        lexer.isInQuotes = true
    if lexer.separators.find(character) != -1 and not lexer.isInQuotes:
      lexer.tokens.add(lexer.token)
      lexer.token = ""
      if lexer.skippedCharacters.find(character) == -1:
        lexer.tokens.add(character.repr())
    else:
      lexer.token = lexer.token & character
      if i == len(lexer.src) - 1:
        lexer.tokens.add(lexer.token)
  return lexer.tokens

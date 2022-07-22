type Lexer* = ref object
  src: string
  separators: array[0..10, char]
  skippedCharacters: array[0..0, char]
  tokens: seq[string]
  isInString: bool
  token: string

proc init(lexer: Lexer) =
  lexer.separators = [' ', '\n', '.', '(', ')', '{', '}', '\'', '\"', '=', ':']
  lexer.skippedCharacters = [' ']
  lexer.tokens = @[]
  lexer.token = ""
  lexer.isInString = false
  lexer.src = ""

proc lex*(lexer: Lexer, src: string): seq[string] =
  lexer.init()
  lexer.src = src
  for i, character in lexer.src:
    if character == '"':
      if lexer.isInString:
        lexer.isInString = false
        lexer.token = lexer.token & character
        lexer.tokens.add(lexer.token)
        lexer.token = ""
        continue
      else:
        lexer.isInString = true
    if lexer.separators.find(character) != -1 and not lexer.isInString:
      lexer.tokens.add(lexer.token)
      lexer.token = ""
      if lexer.skippedCharacters.find(character) == -1:
        lexer.tokens.add(character.repr())
    else:
      lexer.token = lexer.token & character
      if i == len(lexer.src) - 1:
        lexer.tokens.add(lexer.token)
  return lexer.tokens

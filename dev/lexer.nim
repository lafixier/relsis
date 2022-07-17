proc read_file(file_path: string): string =
  var f: File = open(file_path, FileMode.fmRead)
  defer:
    close(f)
  result = f.readAll()

proc lex(src: string): seq[string] =
  const separators: array[0..10, char] = [' ', '\n', '.', '(', ')', '{', '}', '\'', '\"', '=', ':']
  const skippedCharacters: array[0..0, char] = [' ']
  var tokens: seq[string] = @[]
  var token = ""
  var isInString = false
  for i, character in src:
    if character == '"':
      if isInString:
        isInString = false
        token = token & character
        tokens.add(token)
        token = ""
        continue
      else:
        isInString = true
    if separators.find(character) != -1 and not isInString:
        tokens.add(token)
        token = ""
        if skippedCharacters.find(character) == -1:
          tokens.add(character.repr())
    else:
      token = token & character
      if i == len(src) - 1:
        tokens.add(token)
  return tokens

let src = read_file("./dev/hello_world.relsis")
let tokens = lex(src)
for token in tokens:
  echo token

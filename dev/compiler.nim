import types
import lexer
import parser


proc read_file(file_path: string): string =
  var f: File = open(file_path, FileMode.fmRead)
  defer:
    close(f)
  result = f.readAll()

proc compile(src: string) =
  let tokens: seq[string] = lex(src)
  let ast: Ast = parse(tokens)
  # echo tokens
  # echo ast

proc main() =
  let src = read_file("./dev/hello_world.relsis")
  compile(src)


main()

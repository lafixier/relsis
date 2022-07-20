import types
import lexer
import parser


proc read_file(file_path: string): string =
  var f: File = open(file_path, FileMode.fmRead)
  defer:
    close(f)
  result = f.readAll()

proc compile(src: string) =
  let lexer = Lexer()
  let parser = Parser()
  let tokens: seq[string] = lexer.lex(src)
  let ast: Ast = parser.parse(tokens)
  # echo tokens
  # echo ast

proc main() =
  let src = read_file("./dev/hello_world.relsis")
  compile(src)


main()

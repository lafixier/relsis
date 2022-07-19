import types


proc divideIntoSentences(tokens: seq[string]): seq[Sentence] =
  let sentences: seq[Sentence] = @[]
  for token in tokens:
    echo token
  result = sentences


proc parse* (tokens: seq[string]): Ast =
  let ast: Ast = @[]
  let sentences: seq[Sentence] = divideIntoSentences(tokens)
  result = ast

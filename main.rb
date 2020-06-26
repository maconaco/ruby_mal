require "./tokenizer"
require "./parser"

tokenizer = Tokenizer.new("(+ 10 22 (+ 1 2) 3)", 0)
puts tokenizer.call
p "tokenize --------------------------"
tokens = p tokenizer.tokenize

index = 0

parser = Parser.new(0,tokens)

p "parse -----------------------------"
p parser.curr
p parser.parse
p "node -----------------------------"
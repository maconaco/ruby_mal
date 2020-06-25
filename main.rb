require './tokenizer.rb'
require './parser.rb'

p "tokenizer --------------------------"
tokenizer = Tokenizer.new("(+ 10 22 (+ 1 2) 3)", 0)
puts tokenizer.call
tokens = p tokenizer.tokenize

index = 0

parser = Parser.new(0, "#{tokens[index]}")

p "parser --------------------------"
p parser.node
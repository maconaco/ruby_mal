require './tokenizer.rb'
require './parser.rb'

tokenizer = Tokenizer.new("(+ 10 22 (+ 1 2) 3)", 0)
puts tokenizer.call
tokens = p tokenizer.tokenize

index = 0

parser = Parser.new(0, "#{tokens[index]}")

p parser.call
p parser.index
p parser.call2
p "consume --------------------------"
p parser.consume
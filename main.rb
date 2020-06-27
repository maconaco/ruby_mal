require "./tokenizer"
require "./parser"

#tokenizer = Tokenizer.new("(+ 10 22 (+ 1 2) 3)", 0)
tokenizer = Tokenizer.new("(+ 1 2 (+ 3 4))", 0,)
puts tokenizer.call
p "tokenize --------------------------"
tokens = p tokenizer.tokenize

index = 0

# インスタンス化する時に空配列わたすの、だいたい頭の悪いパターンなのでやめとく
parser = Parser.new(0,tokens)

p "parse -----------------------------"
p parser.parse

=begin
[
  {:type=>:Exprr,
    :val=>{:type=>:OPERATOR, :val=>"+"},
      :children=>[
        {:type=>:NumberNode,:val=>{:type=>:NUMBER, :val=>3}},
        {:type=>:NumberNode, :val=>{:type=>:NUMBER, :val=>4}}
      ]
    },
  {:type=>:Exprr,
    :val=>{:type=>:OPERATOR, :val=>"+"},
      :children=>[
        {:type=>:NumberNode, :val=>{:type=>:NUMBER, :val=>1}},
        {:type=>:NumberNode, :val=>{:type=>:NUMBER, :val=>2}}
      ]
  }
]
=end
p "node -----------------------------"

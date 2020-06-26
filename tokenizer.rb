class String
  def number?
    match(/[0-9]/)
  end
end

class Tokenizer
  attr_accessor :source, :index

  def initialize(source, index)
    @source = source
    @index = index
  end

  def call
    puts @source
  end

  def peek
    @index < @source.length {-1} ? @source[@index+1] : ''
  end

  def tokenize
    @index = 0
    tokens = []
    while @index < @source.length
      c = @source[@index]

      next if c.empty?

      r = case c
      when '(' then {type: :LPAREN}
      when ')' then {type: :RPAREN}
      when '+' then {type: :OPERATOR, val: c}
      when '*' then {type: :OPERATOR, val: c}
      when '-' then {type: :OPERATOR, val: c}
      when '/' then {type: :OPERATOR, val: c}
      else {type: :UNKNOWN}
      end

      tokens.push r unless r[:type] == :UNKNOWN

      if c.number?
        str = c
        next_char = peek
        while @index < @source.length and next_char.number? do
          @index+=1
          str += next_char
          next_char = peek
        end
        tokens.push({type: :NUMBER, val: str.to_i})
      end
      @index+=1
    end
    tokens
  end
end

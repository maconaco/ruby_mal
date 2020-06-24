
=begin
t_hash = {}
token_hash[:type] = 'LPAREN || 'RPAREN' || 'NUMBER' || 'OPERATOR'

分解後

valにはtypeがNUMBER以外なら文字列で値が入る、typeがNUMBERなら数字が値で入る

[
  {:type => 'LPAREN', :val => '('},
  {:type => 'PERATOR', :val => '+'},
  {:type => 'NUMBER', :val => 10},
  {:type => 'NUMBER', :val => 22},
  {:type => 'NUMBER', :val => 3},
  {:type => 'RPAREN', :val => ')'}]
=end

=begin
typeには入力された文字が'('ならLPARENていう文字列
'+' || '-' || '*' || '/' なら'OPERATOR'ていう文字列
入力された文字が数字なら'NUMBER'ていう文字列
、')'なら'RPAREN'ていう文字列
=end

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
    puts "peek: @source[#{@index+1}] = #{@source[@index+1]}"
    if @index < @source.length {-1} then
      return @source[@index+1]
    end
    return ''
  end

  def tokenize
    @index = 0
    tokens = []
    while @index < @source.length
      c = @source[@index]
      puts "next loop: @source[#{@index}] = #{@source[@index]}"

      next if c.empty?

      r = case c
      when '(' then :LPAREN
      when ')' then :RPAREN
      when '+' then :OPERATOR
      when '*' then :OPERATOR
      when '-' then :OPERATOR
      when '/' then :OPERATOR
      else :UNKNOWN
      end

      tokens.push c unless r == :UNKNOWN

      if c.number?
        str = c
        next_char = peek
        while @index < @source.length and next_char.number? do
          @index+=1
          str += next_char
          next_char = peek
        end
        tokens.push str.to_i
      end
      @index+=1
    end
    tokens
  end
end


tokenizer = Tokenizer.new("(+ 10 22 3)", 0)
puts tokenizer.call
p tokenizer.tokenize

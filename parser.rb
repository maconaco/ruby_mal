require "./tokenizer"

class Parser
  attr_accessor :index, :tokens
  def initialize(index, tokens)
    @index = index
    @tokens = tokens
  end
  def node_type
    @index = 0
    case @tokens[@index][:type]
      when :LPAREN then :LPAREN
      when :RPAREN then :RPAREN
      when :OPERATOR then :OPERATOR
      when :NUMBER then :NUMBER
      else :Unknown
    end
  end
  def curr
    @index < @tokens.length - @index ? @tokens[@index+1] : ''
  end
  def parse_expr
  end
  def parse
    if @tokens[@index][:type] == :LPAREN
      return {type: :Exprr, val: curr}
    end
    return {type: :NumberNode, val: @tokens[@index]}
    if @tokens[@index][:type] == [:RPAREN]
    end
  end

  def evaluate
  end
end

require "./tokenizer"

class Parser
  attr_accessor :index, :tokens, :node

  def initialize(index, tokens)
    @index = index
    @tokens = tokens
    @node = []
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
    @tokens[@index]
  end

  def parse_expr
    op = curr
    @index+=1

    nums = []
    while @tokens[@index][:type] == :NUMBER do
      nums.push(parse_num)
    end
    parse
    p "#{parse}"
    {type: :Exprr, val: op, children: nums}
  end

  def parse_num
    tok = curr
    return nil if tok.nil?
    if tok[:type] == :LPAREN
      parse
    else
      @index+=1
      {type: :NumberNode, val: tok}
    end
  end

  def parse
    c = @tokens[@index]
    if c[:type] == :LPAREN then
      @index+=1
      @node.push parse_expr
    elsif c[:type] == :NUMBER then
      @node.push parse_num
    elsif c[:type] == :RPAREN then
        "RPARENです"
    else
      "error #{c}"
    end
  end

  def evaluate
  end
end
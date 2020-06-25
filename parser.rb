class Parser
  attr_accessor :index

  def initialize(index, tok)
    @index = index
    @tok = tok
  end
  def consume(c)
    c = @tok
    c == @tok ? @index+=1 : false
  end

  def node
    @index = 0
    node = case @tok
      when '+' then :Operator
      when '*' then :Operator
      when '-' then :Operator
      when '/' then :Operator
      when /[0-9]/ then :Integer
      else :Unknown
    end
  end

  def parse
    if !consume(@tok == '(') then
    end
  end
end
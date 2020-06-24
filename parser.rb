class Parser
  attr_accessor :index
  def initialize(index, tok)
    @index = index
    @tok = tok
  end
  def call
    puts @index
  end
  def call2
    puts @tok
  end

  def consume
    c = @tok
    p c
    p @index.class
    c == @tok ? @index+=1 : false
    p c
    p "#{@index+=1}"
  end
end
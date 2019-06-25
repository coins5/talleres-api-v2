class Otest
  def initialize ()
    @val = 0
  end
private
  def sum_val ()
    @val = @val + 1
  end
end

class Test < Otest
  def ttest
    sum_val()
    puts @val
  end
end

t = Test.new
t.ttest()
t.sum_val()

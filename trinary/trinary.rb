class Trinary
  attr_reader :num

  def initialize(num)
    @num = num 
  end

  def to_decimal
    return 0 if num =~ /[^012]/
    num.to_i.digits.each_with_index { |u, index| u * 3**index  }.sum
  end
end


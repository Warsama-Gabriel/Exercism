class Triangle
  attr_reader :sides

  def initialize(sides)
    @sides = sides 
  end

  def equilateral?
    valid_triangle? && sides.uniq.size == 1
  end

  def isosceles?
    valid_triangle? && sides.uniq.size <= 2
  end

  def scalene?
    valid_triangle? && sides.uniq.size == 3
  end

  private
  
  def valid_triangle?
    sides.all?(&:positive) &&
    sides.permutation(3).all? { |a, b, c| a + b >= c }
  end
end

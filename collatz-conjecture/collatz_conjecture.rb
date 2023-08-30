class CollatzConjecture
  def self.steps(n)
    raise ArgumentError if n <= 0
    
    if n == 1
      0
    elsif n.even?
      1 + CollatzConjecture.steps(n / 2)
    else 
      1 + CollatzConjecture.steps((3 * n) + 1)
    end
  end
end
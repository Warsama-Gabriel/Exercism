class Palindromes
 
  Palindrome = Struct.new(:value, :factors)
  
  def initialize(min_factor: 1, max_factor: )
    @min_factor = min_factor
    @max_factor = max_factor
  end

  def generate
    (min_factor..max_factor).to_a.repeated_combination(2) do |pair|
      product = pair.reduce(:*)
      palindromes[product] << pair if is_palindrome?(product)
    end
  end

  def largest
    Palindrome.new(*palindromes.max)
  end

  def smallest
    Palindrome.new(*palindromes.min)
  end
  
  private 

  attr_reader :min_factor, :max_factor

  def is_palindrome?(number)
    number.to_s == number.to_s.reverse
  end

  def palindromes
    @palindromes ||= Hash.new { |hash, key| hash[key] = [] }
  end
end
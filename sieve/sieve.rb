class Sieve
  attr_reader :limit

  def initialize(limit)
    @limit = limit
  end

  def primes
    marked_numbers = []
    primes = []
    
    (2..limit).each do |num|
      if !marked_numbers.include?(num)
         primes << num
      end
      (num..limit).step(num) { |num| marked_numbers << num }
      marked_numbers.sort!.uniq!
    end
    
    primes
  end
end
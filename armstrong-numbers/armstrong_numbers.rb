class ArmstrongNumbers
  
  def self.include?(number)
    digits_size = number.digits.size
    number == number.digits.map { |e| e**digits_size }.reduce(:+)
  end
end
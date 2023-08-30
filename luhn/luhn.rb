class Luhn
  attr_reader :luhn_number

  INVALID_REGEX = /\D/

  def initialize(luhn_number)
    @luhn_number = normalize(luhn_number)
  end

  def self.valid?(luhn_number)
    new(luhn_number).valid?
  end

  def valid?
    return false if luhn_number_invalid?
    return false if luhn_number_too_short?
    
    luhn_sum % 10 == 0
  end
  
  def luhn_number_invalid?
    luhn_number =~ INVALID_REGEX
  end

   def luhn_number_too_short?
    luhn_number.size < 2
  end

  def digits
    @digits ||= luhn_number.chars.map(&:to_i)
  end

  def luhn_sum
    digits
      .reverse
      .each_with_index
      .map { |e, i| (i.odd? ? (e*2 > 9 ? e*2 - 9 : e*2) : e) }
      .reduce(:+)
  end
  
  private

  def normalize(luhn_number)
    String(luhn_number).gsub(/[\s]/, "")
  end
end




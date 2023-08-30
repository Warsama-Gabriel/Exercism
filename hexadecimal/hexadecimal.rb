class Hexadecimal
  attr_reader :to_decimal
   
  def initialize(str)
    @to_decimal = str =~ /[^0-9a-f]/ ? 0 : str.to_i(16)
  end
end
class BaseConverter

  def self.convert(input_base, digits, output_base)
    validate_input(input_base, digits, output_base)
    decimal_value = calculate_decimal_value(digits, input_base)
    convert_decimal_output_base(decimal_value, output_base)
  end

  def self.calculate_decimal_value(digits, input_base)
    digits.reverse.each_with_index.sum { |digit, index| digit * (input_base**index) }
  end

  def self.convert_decimal_output_base(decimal_value, output_base)
    converted_digits = []
    while decimal_value > 0
      converted_digits.unshift(decimal_value % output_base)
      decimal_value /= output_base
    end
    converted_digits.empty? ? [0] : converted_digits
  end

  def self.validate_input(input_base, digits, output_base)
    raise ArgumentError if input_base <= 1 || output_base <=1
    raise ArgumentError if digits.any?(&:negative?) || digits.any? { |digit| digit >= input_base }
  end
end
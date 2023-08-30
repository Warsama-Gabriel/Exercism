class Binary
  def self.to_decimal(num)
    raise ArgumentError if num =~ /[^01]/
    num.to_i.digits.each_with_index.sum { |u, index| u*(2**index) }
  end
end
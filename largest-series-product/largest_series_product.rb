class Series
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def largest_product(slices)
    validate_slice_number?(slices)
    number.chars.each_cons(slices).map { |slice| slice.map(&:to_i).reduce(:*) }.max
  end

  private

  def validate_slice_number?(slices)
    raise ArgumentError unless valid_slice_number?(slices)
  end

  def valid_slice_number?(slices)
    slices.between?(1, number.length) && number.match?(/^\d+$/)
  end
end
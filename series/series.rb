
class Series
  attr_reader :string
  
  def initialize(string)
    @string = string
  end

  def slices(slice_number)
    validate_slice_number?(slice_number)
    string.chars.each_cons(slice_number).map(&:join)
  end

  private

  def validate_slice_number?(slice_number)
    raise ArgumentError unless valid_slice_number?(slice_number)
  end

  def valid_slice_number?(slice_number)
    slice_number.between?(1, string.length)
  end
end
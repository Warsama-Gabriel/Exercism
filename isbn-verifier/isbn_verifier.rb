class IsbnVerifier
  
  attr_reader :isbn

  ISBN_MULTIPLIERS = 10.downto(1).to_a

  def initialize(isbn)
    @isbn = normalize isbn
  end

  def self.valid?(isbn)
    new(isbn).valid?
	end

  def valid?
    return false unless isbn =~ /^\d{9}[\dX]$/

    transform_isbn.zip(ISBN_MULTIPLIERS).map { |x,y| x * y }
                                        .reduce(:+).%(11) == 0
  end

  private

  def normalize(isbn)
    isbn.gsub("-","")
  end

  def transform_isbn
    isbn.chars.map { |x| x == 'X' ? 10 : x }.map(&:to_i)
  end
end
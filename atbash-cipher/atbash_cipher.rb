
class Atbash
  attr_reader :string
  
  CIPHER = ("a".."z").zip(("a".."z").to_a.reverse).to_h
                     .merge(("0".."9").to_a.zip("0".."9").to_a.to_h)

  def initialize(string)
    @string = normalize(string)
  end

  def self.encode(string)
    new(string).encode
  end

  def self.decode(string)
    new(string).decode
  end

  def encode
    translation.each_slice(5).to_a.map(&:join).join(' ')
  end

  def decode
   translation.join
  end

  private

  def translation
    CIPHER.values_at(*string)
  end

  def normalize(string)
    string.downcase.gsub(/\W/, "").chars
  end
end
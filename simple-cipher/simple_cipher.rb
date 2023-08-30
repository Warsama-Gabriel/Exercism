class Cipher
  attr_reader :key

  DICTIONARY = ("a".."z").to_a
  LOWERCASE_ALPHABET_ORD_RANGE = Range.new(97, 112)
  KEY_LENGTH = 100
  ALPHABET_LENGTH = 26

	def initialize(key=random_key)
    raise ArgumentError unless key.match /^[a-z]+$/
    @key = key
  end

  def encode(plaintext)
    transform(plaintext).map { |x,y| (x+y) % ALPHABET_LENGTH }
                        .map { |u| DICTIONARY[u] }
                        .join
  end

  def decode(ciphertext)
    transform(ciphertext).map { |x,y| (x-y) % ALPHABET_LENGTH }
                         .map { |u| DICTIONARY[u] }
                         .join
  end

  private

  def random_key
    Array.new(KEY_LENGTH).map { (rand(LOWERCASE_ALPHABET_ORD_RANGE)).chr }.join
  end

  def transform(text)
    text.chars.map {|letter| DICTIONARY.index(letter) }
              .zip(key.chars.map{|letter| DICTIONARY.index(letter)})
  end
end
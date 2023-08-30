class Cipher
  attr_reader :key
  
  DICTIONARY = ("a".."z").to_a
  RANDOM_KEY = (0...100).map { (rand(97..112)).chr }.join
  def initialize(key=RANDOM_KEY)
    @key = key
  end
  
  def encode(plaintext)
    #takes the key splits it and adds numeric value to letter.ord
    #returns the charachter then joins it.
    plaintext.chars.map {|letter| DICTIONARY.index(letter) }
                   .zip(key.chars.map{|letter| DICTIONARY.index(letter)})
                   .map {|x,y| (x+y) % 26 }
                  

    # @_encode ||= plaintext.split.map do |letter|
    #   (letter.ord + DICTIONARY[]).chr #returns position to shift
    # end.join
  end

  def decode
    @_decode ||= encode(plaintext).split.map do |letter|
    end
  end

  private

  def normalize_key
    key.chars
  end
end
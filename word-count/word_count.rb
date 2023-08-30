class Phrase
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def word_count
    words = word.downcase.scan(/\b[\w']+\b/)
    words.group_by(&:itself).transform_values(&:count)
  end
end
class Anagram
  attr_reader :subject

  def initialize(subject)
    @subject = subject
  end

  def match(word_list)
    word_list.select { |word| subject_is_anagram_of?(word) }
  end

  private

  def subject_is_anagram_of?(word)
    format_word(word) == format_word(subject) && !word.downcase.eql?(@subject.downcase)
  end

  def format_word(word)
    word.downcase.chars.sort
  end
end
class Isogram
  attr_reader :input

  def initialize(input)
    @input = input
  end

  class << self
    def isogram?(input)
      new(input).isogram_check
    end
  end

  def isogram_check
    words == words.uniq
  end

  private

  def words
    normalize(input).gsub(/\W/, "").chars
  end

  def normalize(input)
    input.downcase
  end
end

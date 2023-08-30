class Acronym
  attr_reader :phrase
  
  def initialize(phrase)
    @phrase = String(phrase)
  end

  class << self
    def abbreviate(phrase)
      new(phrase).abbreviation
    end
  end

  def abbreviation
    words
      .map { |w| w[0]  }
      .join
  end

  def words
    normalize(phrase).split(/\W/)
  end

  private

  def normalize(phrase)
    phrase.upcase
  end
end

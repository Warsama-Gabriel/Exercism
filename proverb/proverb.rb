class Proverb
  
  def initialize(*words, qualifier: nil)
    @words = words
    @qualifier = qualifier
  end

  def to_s
    words.each_cons(2).map do |a, b|
      "For want of a #{a} the #{b} was lost."
    end.
      join("\n") + "\nAnd all for the want of a #{qualifier_statement}."
  end

  private
  
  attr_reader :words, :qualifier

  def qualifier_statement
    qualifier.nil? ? words.first : "#{qualifier} #{words.first}"
  end
end

class Nucleotide
  attr_accessor :string

  def initialize(string)
    @string = string
  end

	def self.from_dna(string)
    self.new(string) unless nucleotides_valid?(string)
  end

  def count(letter)
    @string.count(letter)
  end

  def histogram
    nucleotides = {
      'A' => 0,
      'T' => 0,
      'C' => 0,
      'G' => 0,
    }

    @string.chars.each_with_object(nucleotides) { |v, h| h[v] += 1 }
  end

  private

  def self.nucleotides_valid?(string)
    raise ArgumentError unless string.count('^ATCG').zero?
  end
end
class RunLengthEncoding
  def self.encode(string)
    string.gsub(/(\D)\1+/) { |match| encode_match(match) }
  end

  def self.decode(string)
    string.gsub(/\d+./) { |match| decode_match(match) }
  end

  private

  def self.encode_match(match)
    count = match.length.to_s
    character = match[0]
    count == '1' ? character : "#{count}#{character}"
  end

  def self.decode_match(match)
    count = match.to_i
    character = match[-1]
    character * count
  end
end
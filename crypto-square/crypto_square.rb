class Crypto
  def initialize(text)
    @text = text.downcase.gsub(/\W+/, '')
  end

  def ciphertext
    if text.empty?
      return ""
    else
      transpose_slices
    end
  end

  private

  def size
    Math.sqrt(text.size).ceil
  end

  def slices
    slices = text.split("").each_slice(size).to_a

    slices.last << " " while slices.last.length < size
    slices
  end

  def transpose_slices
    slices.transpose.map(&:join).join(" ")
  end

  attr_reader :text
end

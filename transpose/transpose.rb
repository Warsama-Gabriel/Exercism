class Transpose
  def self.transpose(input)
    arr = input.split("\n").map(&:chars)
    l = arr.map(&:length).max
    arr.map {|e| e.values_at(0..l)}.transpose.map { |u| u.reverse.drop_while(&:nil?)
       .reverse.map {|g| g.nil? ? " " : g }}.reject(&:empty?)
       .map(&:join).join("\n")
  end
end

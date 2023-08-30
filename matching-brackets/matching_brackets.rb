class Brackets
  BRACKETS = { '{' => '}', '[' => ']', '(' => ')' }.freeze
  OPEN_BRACKETS = BRACKETS.keys
  CLOSE_BRACKETS = BRACKETS.values
  
  def self.paired?(input)
    input.chars.each_with_object([]) do |elem, array|
      if OPEN_BRACKETS.include?(elem)
        array.push(elem)
      elsif CLOSE_BRACKETS.include?(elem)
        return false unless BRACKETS[array.last].eql?(elem)
        array.pop
      end
    end.empty?
  end
end
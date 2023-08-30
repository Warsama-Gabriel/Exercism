class Tournament
  def self.tally(input)
    self.new.tally(input)
  end

  def tally(input)
    headers = ['Team', 'MP', 'W', 'D', 'L', 'P']
    
    str = format(headers)

    tally = Hash.new { |hash, key| hash[key]  = { mp: 0, w: 0, d: 0, l: 0, p: 0 } }

    input.split("\n").map(&:strip).each do |row|
      home, away, result = row.split(';')
      
      tally[home][:mp] += 1
      tally[away][:mp] += 1
      
      case result
      when 'win'
        tally[home][:w] += 1
        tally[home][:p] += 3
        tally[away][:l] += 1
      when 'draw'
        tally[home][:d] += 1
        tally[home][:p] += 1
        tally[away][:d] += 1
        tally[away][:p] += 1
      when 'loss'
        tally[away][:w] += 1
        tally[away][:p] += 3
        tally[home][:l] += 1
      end
    end

    tally.sort_by { |k,v| [-v[:p], k] }.each do |k,v|
      arr =  [k, v[:mp], v[:w], v[:d], v[:l], v[:p]]
      str << format(arr)
    end

    str
  end

  def format(array)
    sprintf "%-30s | %2s | %2s | %2s | %2s | %2s\n", *array
  end
end
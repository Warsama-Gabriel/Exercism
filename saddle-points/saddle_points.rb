class Matrix
  attr_reader :matrix
	
  def initialize(matrix)
    @matrix = format(matrix)
  end

  def rows
    matrix
  end

  def columns
    matrix.transpose
  end

  def saddle_points
    max_row = rows.map(&:max)
    min_col = columns.map(&:min)
    saddle_points = []

    rows.each_with_index do |row, i|
      row.each_with_index do |element, j|
        if element >= max_row[i] && element <= min_col[j]
          saddle_points << [i, j]
        end
      end
    end

    saddle_points
  end
  
  def format(matrix)
    matrix.split("\n").map { |i| i.split(" ").map(&:to_i) }
  end
end

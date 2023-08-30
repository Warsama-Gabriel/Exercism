class Grains
  
  BOARD_SIZE = 64
  
  def self.square(num)
    raise ArgumentError if number_is_invalid(num)
    return 1 if num == 1
    2 ** (num - 1)
  end

  def self.total
    square = BOARD_SIZE
    total = 0
    until square == 0
      total += 2 ** (square - 1)
      square -= 1
    end
    total
  end

  def self.number_is_invalid(num)
    num < 1 || num > BOARD_SIZE
  end
end
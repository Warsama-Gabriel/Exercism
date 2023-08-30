class ListOps
	def self.arrays(array)
    count = 0
   
    loop do 
      array.fetch(count) { return count }
      count += 1
    end

    count
  end

  def self.reverser(array)
    reversed = []
    i = arrays(array) - 1
    while i >= 0
      reversed << array[i]
      i -= 1
    end
    reversed
  end

  def self.concatter(array1, array2)
    array1 + array2
  end

  def self.mapper(array)
    new_array = []
    i = 0
    count = arrays(array)- 1

    while i <= count do 
      new_array << yield(array[i])
      i += 1
    end

    new_array
  end

  def self.filterer(array)
    new_array = []
    i = 0
    count = arrays(array) - 1

    while i <= count do 
      new_array << array[i] if yield(array[i])
      i += 1
    end

    new_array
  end

  def self.sum_reducer(array)
    i = 0
    count = arrays(array) - 1
    sum = 0 
    while i <= count do 
      sum += array[i]
      i += 1
    end

    sum
  end

  def self.factorial_reducer(array)
    i = 0
    count = arrays(array) - 1
    product = 1

    while i <= count do 
      product *= array[i]
      i += 1
    end
    product
  end


end
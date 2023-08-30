class BinarySearch

  attr_reader :array
  
  def initialize(array)
    @array = array
  end

  def search_for(num, s=0, e=array.size)
    return nil if @array.empty?
    loop do 
      m = (s + e) / 2

      if @array[m] == num
        return m
      elsif s < e && @array[m] > num
        e = m - 1
      elsif s < e && @array[m] < num 
        s = m + 1
      else
        return nil
      end
    end
  end
end
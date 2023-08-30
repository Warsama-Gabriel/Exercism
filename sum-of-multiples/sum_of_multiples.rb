class SumOfMultiples
  def initialize(*nums)
    @nums = nums
  end

  def to(limit)
    @nums.flat_map do |num|
      (num...limit).step(num).to_a
    end.uniq.sum
  end
end

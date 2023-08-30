class ETL
  def self.transform(old)
    new_hash = {}
    old.each do |key, value|
      value.each do |element|
        new_hash[element.downcase] = key
      end
    end
    new_hash
  end
end
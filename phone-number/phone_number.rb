class PhoneNumber
  def self.clean(number)
    cleaned_number = number.gsub(/\D/, "").gsub(/^1/, "")
    if !valid_number?(cleaned_number)
      return nil
    end
    cleaned_number
  end

  def self.valid_number?(cleaned_number)
    !cleaned_number.empty? &&
    valid_number_size?(cleaned_number) &&
    valid_area_code?(cleaned_number) &&
    valid_exchange_code?(cleaned_number)
  end

  def self.valid_number_size?(cleaned_number)
    cleaned_number.size == 10
  end

  def self.valid_area_code?(cleaned_number)
    valid_format?(cleaned_number, 0)
  end

  def self.valid_exchange_code?(cleaned_number)
    valid_format?(cleaned_number, 3)
  end

  private

  def self.valid_format?(cleaned_number, index)
    cleaned_number[index].to_i.between?(2,9)
  end
 end

class ResistorColorTrio
  attr_reader :colors

  COLORS = { 
    'black' => 0,
    'brown' => 1,
    'red' => 2,
    'orange' => 3,
    'yellow' => 4,
    'green' => 5,
    'blue' => 6,
    'violet' => 7,
    'grey' => 8,
    'white' => 9,
  }.freeze
  
  def initialize(colors)
    @colors = colors
  end

  def label
    raise ArgumentError if invalid_colors_present?

    resistances = COLORS.fetch_values(*colors)

    resistance_values = resistances.take(colors.size - 1)
    exponent = 10 ** resistances.last 
    number_of_ohms = resistance_values.join.to_i * exponent
    
    if number_of_ohms >= 1000
      "Resistor value: #{number_of_ohms / 1000} kiloohms"
    else
      "Resistor value: #{number_of_ohms} ohms"
    end
  end

  private

  def invalid_colors_present?
    !colors.all? { |c| COLORS.has_key? c }
  end
end
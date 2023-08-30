class Scale
  attr_reader :tonic, :mode, :intervals
  
  KEYS = {
    flats:  %w(F Bb Eb Ab Db Gb d g c f bb eb),
    sharps: %w(C G D A E B F# e b f# c# g# D# a)
  }
  
  CHROMATIC_SCALE = {
    flats:  %w(A Bb B C Db D Eb E F Gb G Ab),
    sharps: %w(A A# B C C# D D# E F F# G G#)
  }

  STEPS = {
    'm' => 1, 
    'M' => 2,
    'A' => 3
  }
  
  def initialize(tonic, mode, intervals=chromatic_intervals)
    @tonic = tonic
    @mode = mode
    @intervals = intervals.chars.map(&STEPS)
  end

  def name
    "#{tonic.capitalize} #{mode.to_s}"
  end

  def pitches
    rotated_scale.values_at(*note_intervals)
  end

  private

  def chromatic_scale
    CHROMATIC_SCALE[flats_or_sharps]
  end

  def rotated_scale
    chromatic_scale.rotate(chromatic_scale.index(tonic.capitalize))
  end

  def chromatic_intervals
    'mmmmmmmmmmmm'
  end

  def flats_or_sharps
    KEYS.find { |_,v| v.include?(tonic) }.first
  end

  def note_intervals
    next_index = 0
    intervals.map do |u|
      index = next_index
      next_index += u
      index
    end
  end
end
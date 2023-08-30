class TwelveDays
  LYRICS = [
    'a Partridge in a Pear Tree',
    'two Turtle Doves', 
    'three French Hens',
    'four Calling Birds',
    'five Gold Rings', 
    'six Geese-a-Laying',
    'seven Swans-a-Swimming',
    'eight Maids-a-Milking', 
    'nine Ladies Dancing',
    'ten Lords-a-Leaping',
    'eleven Pipers Piping',
    'twelve Drummers Drumming',
  ]

  DAYS = [
    'first',
    'second',
    'third',
    'fourth',
    'fifth',
    'sixth',
    'seventh',
    'eighth',
    'ninth',
    'tenth',
    'eleventh',
    'twelfth',
  ]

  def self.song
    self.new.process
  end

  def process
    DAYS.each_with_index.map do |day, index|
      format_string(day, index)
    end.join("\n\n") + "\n"
  end

  def format_string(day, index)
    "On the #{day} day of Christmas my true love gave to me: #{format_verse(LYRICS[0..index])}."
  end

  def format_verse(lyrics)
    return lyrics[0] if lyrics.size == 1
    
    lyrics.each_with_index.map do |lyric, index|
      index == 0 ? "and #{lyric}" : lyric  
    end.reverse.join(", ")
  end
end
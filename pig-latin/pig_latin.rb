class PigLatin
  
  def self.translate(word)
    
    if word =~ /^[aeiouy]|^xr|^yt/
      value = word + "ay"
    end

    #if word begins with a consanant move cluster to end of the word
    #scan all the words to the first vowel and then move those to the end of the word and add ay
    if word =~ /^[^aeiouy]+/
    	x = word.scan(/^[^aeiouy]+/)
    	value = word.sub(/^[^aeiouy]+/, '') + x.join + "ay"
    end

    #if word begins with consonant and is followed by "qu" move consonant or cluster to the end of the word and add "ay"
    if word =~ /^[^aeiouy]+qu/
    	x = word.scan(/^[^aeiouyq]+/)
    	value = "qu" + x.join + "ay"
    end

    #if word contains a "y" after consonants or as second letter in two letter word => add "ay" to the end
    if word =~ /^[^aeiouy]+y | \wy/
      value = word + "ay"
    end

    value
  end

	#vowels aeiou 
	#if word begins with a vowel sound or "xr" "yt" add an "ay" to the end of the word
	#if word begins with a consonant move the consonant or cluster to the end of the word and add an "ay" to the end
	#if word starts with a consonant and is followed by "qu" move it to the end of the word and add an "ay"
	#if word contains a "y" after consonants or as second letter in two letter word it makes a vowel sounnd => add "ay" to the end
end



# def self.translate(word)
# 		case word
# 		when word.scan(/^[aeiou|xr|yt]/).any?
#       word + "ay"
#     when word.scan()
			
# 	end
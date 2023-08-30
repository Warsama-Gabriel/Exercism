class Bob
  def self.hey statement
		if statement =~ /[[:alpha:]]/ && statement == statement.upcase && !statement.end_with?("?")
      "Whoa, chill out!"
    elsif statement =~ /[[:alpha:]]/ && statement == statement.upcase && statement.end_with?("?") 
      "Calm down, I know what I'm doing!"
    elsif statement.strip.end_with?("?")
      "Sure."
    elsif statement.strip.empty?
      "Fine. Be that way!"
    else
      "Whatever."
    end
	end
end


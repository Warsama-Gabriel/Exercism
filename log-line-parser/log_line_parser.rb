class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    line.split(":").map(&:lstrip).map(&:rstrip)[1]
  end

  def log_level
    line.split(":")[0].gsub(/\W+/, "").downcase
  end

  def reformat
    "#{message} (#{log_level})"
  end

  private

  attr_reader :line
end

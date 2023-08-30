class Robot

	attr_reader :name
	
	@@robot_names = []

	def initialize
		reset
	end

	def reset
		@@robot_names << @name = unique_name
	end

	def self.forget
		@@robot_names = []
	end

	def unique_name
		robot_name = generate_name

		@@robot_names.include?(robot_name) ? unique_name : robot_name
	end

	private

	def digit
		rand 10
	end

	def letter
		('A'..'Z').to_a.sample
	end

	def generate_name
		"#{letter}#{letter}#{digit}#{digit}#{digit}"
	end
end
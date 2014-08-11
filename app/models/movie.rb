class Movie < ActiveRecord::Base
	def flop?
		total_gross > 0 && total_gross < 50000000
	end
	def gross_unknown?
		total_gross.blank? || total_gross.zero?
	end
end

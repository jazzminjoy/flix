module MoviesHelper
	def format_gross(movie)
		if movie.gross_unknown?
			"Unknown"
		else 
			if movie.flop?
				content_tag(:strong, "Flop!")
			else
				"$" + number_to_human(movie.total_gross)
			end
		end
	end

	def format_release_date(movie)
		if movie.released_on.blank?
			"Release date unknown"
		else
			lapse = "(" +
			 time_ago_in_words(movie.released_on) + " ago)"
		end
	end
end

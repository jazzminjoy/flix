require "spec_helper"

describe "Show an individual movie" do 
	it "shows the details of a movie" do
		movie = Movie.create(movie_attributes)

		visit movie_url(movie)
		
		expect(page).to have_text(movie.title)
		expect(page).to have_text(movie.rating)
		expect(page).to have_text(movie.description)
		expect(page).to have_text("May 2, 2008")
		expect(page).to have_text("$318 Million")
	end

	it "shows the total gross if the total gross is numeric and $50M or more" do
		movie = Movie.create(movie_attributes(total_gross: 318412101.00))
		visit movie_url(movie)
		expect(page).to have_text("$318 Million")
	end
	it "shows 'Flop!' if the total gross is numeric and less than 50M" do
		movie = Movie.create(movie_attributes(total_gross: 40000000.00))
		visit movie_url(movie)
		expect(page).to have_text("Flop!")
	end
	it "shows 'Unknown' if the total gross is nil" do
		movie = Movie.create(movie_attributes(total_gross: nil))
		visit movie_url(movie)
		expect(page).to have_text("Unknown")
	end
end
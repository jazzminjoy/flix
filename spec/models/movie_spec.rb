require 'spec_helper'

describe "A movie" do
  
	it "is not a flop if the total gross is $50M or more" do
  		movie = Movie.new(total_gross: 60000000.00)
  		expect(movie.gross_unknown?).to eq(false)
  		expect(movie.flop?).to eq(false)
  	end

  	it "is a flop if the total gross is greater than zero and less than 50M" do
		movie = Movie.new(total_gross: 40000000.00)
		expect(movie.gross_unknown?).to eq(false)
		expect(movie.flop?).to eq(true)
	end

	it "it shows 'Unknown' if the total gross is nil" do
		movie = Movie.new(total_gross: nil)
		expect(movie.gross_unknown?).to eq(true)
	end
end
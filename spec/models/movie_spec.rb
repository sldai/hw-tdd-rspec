require 'rails_helper'

describe "Movie helper methods" do
  before :each do
    movies = [
      {
        "title": "Star Wars",
        "rating": "PG",
        "director": "George Lucas",
        "release_date": "1977-05-25"
      },
      {
        "title": "Blade Runner",
        "rating": "PG",
        "director": "Ridley Scott",
        "release_date": "1982-06-25"
      },
      {
        "title": "Alien",
        "rating": "R",
        "director": nil,
        "release_date": "1979-05-25"
      },
      {
        "title": "THX-1138",
        "rating": "R",
        "director": "George Lucas",
        "release_date": "1971-03-11"
      }
    ]
    movies.each { |movie| Movie.create!(movie) }
  end

  it "search by directors" do
    movies = Movie.by_directors(["George Lucas", "Ridley Scott"])
    res = Set.new()
    movies.each { |movie| res.add(movie.title) }
    expect(res).to eq Set["Star Wars", "THX-1138", "Blade Runner"]
  end
  it "search by single drector" do
    movies = Movie.by_director(["George Lucas"])
    res = Set.new()
    movies.each { |movie| res.add(movie.title) }
    expect(res).to eq Set["Star Wars", "THX-1138"]
  end
end
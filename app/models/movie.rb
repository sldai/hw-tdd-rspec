class Movie < ActiveRecord::Base
  attr_accessible :title, :rating, :description, :release_date, :director
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def self.by_director(director)
    Movie.where(director: director)
  end

  def self.by_directors(directors)
    Movie.where(director: directors)
  end
end

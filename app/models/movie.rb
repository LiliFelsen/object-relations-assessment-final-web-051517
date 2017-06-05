class Movie
  attr_accessor :title

  @@all_movies = []

  def initialize(title)
    self.title = title
    @@all_movies << self
  end

  def self.find_by_name(name)
    @@all_movies.find {|movie| movie.title == name}
  end

  def ratings
    Rating.all.select {|rating| rating.movie == self}
  end

  def viewers
    ratings.map {|rating| rating.viewer}
  end

  def average_rating
    total_ratings = ratings.map {|rating| rating.score}
    average = total_ratings.sum / total_ratings.size
  end

end

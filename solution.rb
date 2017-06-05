# Please copy/paste all three classes into this file to submit your solution!
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


class Rating
  attr_accessor :score, :viewer, :movie

  @@all_ratings = []

  def initialize(score, movie, viewer)
    @score, @movie, @viewer = score, movie, viewer
    @@all_ratings << self
  end

  def self.all
    @@all_ratings
  end

end


class Viewer
  attr_accessor :first_name, :last_name, :rating

  @@all_viewers = []

  def initialize(name)
    @name = name
    @@all_viewers << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all_viewers
  end

  def self.find_by_name(name)
    @@all_viewers.find {|viewer| viewer.name == name}
  end

  def create_rating(score, movie)
    Rating.new(score: score, movie: movie, viewer: self)
  end

end

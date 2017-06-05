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

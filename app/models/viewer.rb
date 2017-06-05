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

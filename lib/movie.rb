class Movie
  @@movie = []
  attr_accessor :title, :release_date, :director, :summary, :url, :url_name
  def initialize(title, release_date, director, summary)
    @title = title
    @release_date = release_date
    @director = director
    @summary = summary
    @url = url_name
    @@movie << self
  end

  def url_name
    "#{title.gsub(" ","_").downcase}.html"
  end

  def self.all
    @@movie
  end

  def self.reset_movies!
    @@movie = []
  end

  def self.make_movies!
    array = []
    file = File.read('./spec/fixtures/movies.txt').each_line do |line|
    array << line.split(" - ")
    end
    array.each do |movie|
      name = movie[0]
      release = movie[1].to_i
      direc = movie[2]
      sum = movie[3]
      Movie.new(name, release, direc, sum)
    end
  end

  def self.recent
    result = @@movie.each_with_object([]){|movie, array| array << movie if movie.release_date >= 2012}
  end

end

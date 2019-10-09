class Song 
  attr_accessor :name, :artist, :genre 
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
    self.artist = artist if !artist.nil? 
    self.genre = genre if !genre.nil? 
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all 
    self.all.clear 
  end 
  
  def save 
    self.class.all << self 
  end 
  
  def self.create(name)
    song = Song.new(name)
    song.save 
    song 
  end 
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end 
  
  def genre=(genre)
    @genre = genre 
    genre.songs << self unless genre.songs.include?(self)
  end 
  
  def self.find_by_name(name)
    self.all.detect {|song| song.name == name} 
  end 
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name).nil? 
      self.create(name)
    else 
      self.find_by_name(name)
    end 
  end 
  
  def self.new_from_filename(filename)
    parse = filename.split(" - ")
    artist = filename.
    song = Song.find_or_create_by_name(parse[1])
  end 
  
  def self.create_from_filename(filename)
  end 
  
end 
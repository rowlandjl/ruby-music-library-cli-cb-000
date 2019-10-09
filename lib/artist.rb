require 'pry'

class Artist 
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
  end 
  
  def self.all 
    @@all 
  end 
  
  def save 
    self.class.all << self 
  end 
  
  def self.create(name)
    artist = Artist.new(name)
    artist.save 
    artist 
  end 
  
  def self.destroy_all 
    self.all.clear 
  end 
  
  def add_song(song)
    if song.artist.nil?
      song.artist = self if Song.all.select {|song| song.name == song}
      self.songs << song 
    end 
  end 
  
  def genres 
    # binding.pry 
    @songs.collect {|song| song.genre}  
  end 
  
end 
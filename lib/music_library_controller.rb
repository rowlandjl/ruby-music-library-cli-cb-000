class MusicLibraryController 
  attr_reader :path 
  
  def initialize(path='./db/mp3s/')
    @path = path 
  end 
  
  def call 
  end 
  
end 
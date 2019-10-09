class MusicLibraryController 
  attr_reader :path 
  
  def initialize(path='./db/mp3s')
    @path = path 
    MusicImporter.new(path).import 
  end 
  
  def call 
    input = nil 
    
    until input == 'exit'
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.strip.downcase  
    end 
  end 
  
  def list_songs 
    Song.all.sort {|a,b| a.name <=> b.name}.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}  
  end 
  
  def list_artists
    Artist.all.sort {|a,b| a.name <=> b.name}.each_with_index {|artist, index| puts "#{index + 1}. #{artist.name}"}
  end 
  
  def list_genres 
    Genre.all.sort {|a,b| a.name <=> b.name}.each_with_index {|genre, index| puts "#{index + 1}. #{genre.name}"}
  end 
  
  def list_songs_by_artist 
    puts "Please enter the name of an artist:"
    input = gets.strip 
    
    Artist.find_by_name(input).songs.sort {|a,b| a.name <=> b.name}.each_with_index {|song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}"} if !Artist.find_by_name(input).nil? 
  end 
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip 
    
    Genre.find_by_name(input).songs.sort {|a,b| a.name <=> b.name}.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}"} if !Genre.find_by_name(input).nil? 
  end 
  
  def play_song 
    puts "Which song number would you like to play?"
    input = gets.strip.to_i  
    
    if input > 0 && input <= Song.all.length 
      array = Song.all.sort{|a,b| a.name <=> b.name} 
      song = array[input-1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end 
  end 
  
end 
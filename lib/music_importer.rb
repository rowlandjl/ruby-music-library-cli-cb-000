class MusicImporter 
  attr_reader :path 
  
  def initialize(path)
    @path = path 
  end 
  
  def files 
    Dir["#{path}/**/*.mp3"].map { |s| s.gsub("#{path}/", "")}
  end 
  
  def import 
    self.files.each {|filename| Song.new_by_filename(filename)} 
  end 
  
end 
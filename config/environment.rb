require 'bundler'
Bundler.require

module Concerns
  module Findable 
    
    def find_by_name(name)
      self.all.detect {|song| song.name == name} 
    end 
    
    def find_or_create_by_name(name)
      if find_by_name(name).nil?
        self.create(name)
      else 
        
    end 
    
  end 
end

require_all 'lib'

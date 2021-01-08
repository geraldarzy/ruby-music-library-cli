

require 'pry'

class Artist

    extend Concerns::Findable

    attr_accessor :name,:songs
   
    @@all = []
    def initialize(name)
        @name = name
        @songs = []
        save
    end

    def self.all
        @@all
    end

    def save
        self.class.all << self
    end

    def self.destroy_all
        @@all.clear
    end

    def self.create(name)
        artist = Artist.new(name)
        artist.save
        self
    end
    
    

    def add_song(song)
        if song.artist == nil
            song.artist = self
        end  
        @songs << song unless @songs.include?(song)
       
       
          
    end

    def genres
        @songs.map{|song|song.genre}.uniq
        
    end 




    
    


end
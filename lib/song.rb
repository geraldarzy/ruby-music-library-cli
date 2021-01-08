

class Song
    
    extend Concerns::Findable

    attr_accessor :name,:artist, :genre
   
    @@all = []
    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist if artist
        self.genre = genre if genre
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
        song = Song.new(name)
        
        self
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end 

    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self)
    end

   

    def self.new_from_filename(filename)
        file = filename.split(" - ")
        artistname, songname, genrename = file[0], file[1], file[2].gsub(".mp3", "")
        a = Artist.find_or_create_by_name(artistname)
        genre = Genre.find_or_create_by_name(genrename)
        
        song = Song.new(songname)
    end
    
end
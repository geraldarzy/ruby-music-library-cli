

class Genre

    extend Concerns::Findable

    attr_accessor :name, :songs
    @@all = []
    def initialize(name)
        @name = name
        save
        @songs = []
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
        genre = Genre.new(name)
        genre.save
        self
    end

    def artists
        Song.all.map{|song|song.artist if song.genre==self}.uniq
    end
end
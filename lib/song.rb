
require 'pry'

class Song
    # Class variables
    @@count = 0
    @@artists = []
    @@genres = []
    @@genre_count = {}
    @@artist_count = {}

    # Instance variables
    attr_reader :name, :artist, :genre

    def self.update_song_tracker(name, artist, genre)
        @@count += 1
        @@artists << artist
        @@genres << genre
        if @@genre_count.keys.include?genre then @@genre_count[genre] +=1 else @@genre_count[genre] = 1 end
        if @@artist_count.keys.include?artist then @@artist_count[artist] +=1 else @@artist_count[artist] = 1 end
    end

    def self.count
        @@count
    end

    def self.artists
        @@artists.uniq
    end

    def self.genres
        @@genres.uniq
    end

    def self.genre_count
        @@genre_count
    end

    def self.artist_count
        @@artist_count
    end

    def initialize(name, artist, genre)
        @name = name
        @artist = artist
        @genre = genre

        Song.update_song_tracker(name, artist, genre)
    end
end

#binding.pry
# song.rb

require 'active_support/inflector'

class Song
  attr_accessor :title, :artist
  attr_reader :rating
  attr_reader :related_artists

  def initialize
    @title = ''
    @artist = ''
  end

  def rating=(rating)
    @rating = rating if (1..5).include? rating
  end

  def add_related_artist(artist)
    @related_artists ||= []
    @related_artists << artist unless @related_artists.include?(artist)
  end

  def to_hash
    {artist: artist, title: title}
  end

  def numbered_related_artists
    numbered = []
    related_artists.each_with_index do |artist, index|
      numbered << "#{index + 1}) #{artist}"
    end
    numbered
  end

  def self.create(song_hash)
    song = Song.new
    song.artist = song_hash[:artist]
    song.title = song_hash[:title]
    song
  end

  def to_param
    "#{artist}-#{title}".parameterize
  end
end

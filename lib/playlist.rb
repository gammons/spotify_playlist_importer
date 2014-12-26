class Playlist
  attr_reader :name, :songs
  attr_accessor :spotify_id

  def initialize(name, songs)
    @name, @songs = name, songs
  end

  def spotify_song_uris
    songs.reject {|s| s.spotify_id.nil? }.map {|s| "spotify:track:#{s.spotify_id}" }
  end

  def spotify_song_count
    songs.select {|s| !s.spotify_id.nil? }.count
  end
end

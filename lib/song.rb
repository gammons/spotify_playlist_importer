class Song
  attr_reader :artist, :song, :album, :label
  attr_accessor :spotify_id

  def initialize(artist = nil, song = nil, album = nil, label = nil)
    @artist = artist
    @song = song
    @album = album
    @label = label
  end

  def to_hash
    {artist: artist, song: song, album: album, label: label, spotify_id: spotify_id}
  end
end

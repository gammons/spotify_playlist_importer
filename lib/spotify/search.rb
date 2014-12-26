module Spotify
  class Search
    def populate_spotify_song_ids!(playlist)
      playlist.songs.each do |song|
        song.spotify_id = find_song(song)
      end
    end

    def find_song(song)
      artist_id = get_artist_id(song.artist)
      return if artist_id.nil?

      album_id = get_album_id(artist_id, song.album)
      return if album_id.nil?

      get_song_id(album_id, song.song)
    end

    def get_album_id(artist_id, album_name)
      albums = Spotify.get(Url + "/artists/#{artist_id}/albums").parsed_response['items']
      real_album_name = FuzzyMatch.new(albums.map {|a| a['name'] }).find(album_name)
      album = albums.find {|a| a['name'] == real_album_name }
      album.nil? ? nil : album['id']
    end

    def get_artist_id(artist_name)
      resp = Spotify.get(Url + "/search", q: artist_name, type: 'artist')
      artist = resp.parsed_response['artists']['items'][0]
      artist.nil? ? nil : artist['id']
    end

    def get_song_id(album_id, song_name)
      songs = Spotify.get(Url + "/albums/#{album_id}/tracks", limit: 50).parsed_response['items']
      real_song_name = FuzzyMatch.new(songs.map {|a| a['name'] }).find(song_name)
      song = songs.find {|s| s['name'] == real_song_name}
      song.nil? ? nil : song['id']
    end
  end
end

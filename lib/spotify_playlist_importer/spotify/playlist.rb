module SpotifyPlaylistImporter
  module Spotify
    class Playlist
      attr_reader :playlist
      def initialize(playlist)
        @playlist = playlist
      end

      def create!
        create_playlist
        add_songs_to_playlist
      end

      def create_playlist
        resp = Spotify.post(Url + "/users/#{SpotifyPlaylistImporter::Spotify.user}/playlists", name: playlist.name, public: true)
        playlist.spotify_id = resp['id']
        resp
      end

      def add_songs_to_playlist
        Spotify.post(Url + "/users/#{SpotifyPlaylistImporter::Spotify.user}/playlists/#{playlist.spotify_id}/tracks", uris: playlist.spotify_song_uris)
      end
    end
  end
end

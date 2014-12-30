module SpotifyPlaylistImporter
  module Spotify
    Url = "https://api.spotify.com/v1"

    def self.access_token=(access_token)
      Thread.current[:spotify_access_token] = access_token
    end

    def self.access_token
      Thread.current[:spotify_access_token]
    end

    def self.user=(user)
      Thread.current[:spotify_user] = user
    end

    def self.user
      Thread.current[:spotify_user]
    end

    def self.get(url, params = nil)
      HTTParty.get(url, query: params, header: "Authorization: Bearer #{self.access_token}")
    end

    def self.post(url, params = nil)
      HTTParty.post(url, body: params.to_json, headers: {"Authorization" => "Bearer #{self.access_token}", "Content-Type" => "application/json"})
    end
  end
end

module Spotify
  Url = "https://api.spotify.com/v1"

  def self.get(url, params = nil)
    HTTParty.get(url, query: params, header: "Authorization: Bearer #{ENV['SPOTIFY_API_TOKEN']}")
  end

  def self.post(url, params = nil)
    HTTParty.post(url, body: params.to_json, headers: {"Authorization" => "Bearer #{ENV['SPOTIFY_API_TOKEN']}", "Content-Type" => "application/json"})
  end
end

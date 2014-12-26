require 'spec_helper'

describe "Radio parser" do
  let(:parser) { WprbParser.new(File.read('spec/support/playlist.php')) }
  let(:search) { Spotify::Search.new }
  let(:playlist) { Playlist.new("test", parser.get_songs) }

  it "parses the playlist and generates song ids" do
    VCR.use_cassette(:populate_spotify_song_ids) do
      search.populate_spotify_song_ids!(playlist)
    end
    expect(playlist.songs.map {|s| s.spotify_id }.compact.count).to eql(17)
  end
end

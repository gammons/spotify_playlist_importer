require 'spec_helper'
describe SpotifyPlaylistImporter::Spotify::Search do
  let(:song) { SpotifyPlaylistImporter::Song.new("Teengirl Fantasy", "Floor to floor", "7AM", nil) }
  it "can find a song" do
    VCR.use_cassette(:find_song) do
      expect(subject.find_song(song)).to eql('3apM29XpfQWRg0MXBbN9Cc')
    end
  end
end

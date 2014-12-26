require 'spec_helper'
describe Spotify::Search do
  let(:song) { Song.new("Teengirl Fantasy", "Floor to floor", "7AM", nil) }
  it "can find a song" do
    VCR.use_cassette(:find_song) do
      subject.find_song(song)
    end
  end
end

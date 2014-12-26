require 'spec_helper'

describe Spotify::Playlist do
  let(:song_ids) do 
    ["3c7xCi2LPquTiopDJAVYNu",
     nil,
     "3apM29XpfQWRg0MXBbN9Cc",
     "2DuRzBqwkz6uzXJVrBkN5g",
     nil,
     "0MCJUzJ78RwFma2HGX0qYI",
     "2UHwgRtMSJtD4mH3Tob3Az",
     nil,
     nil,
     "6X36gTnPSqRvfnPCk3yBsg",
     "0ya4rPCpn0eCh9hGTELVJw",
     "1S8FBwS475qrBhJhWtqeiP",
     nil,
     "2hNFIQQZCLim87yHjTkBwB",
     "4hAuBKwUBCqJRcuWArpTjV",
     "5Xc0N7o6JNUhrHi7ultPZS",
     "4wNrVHzfxMpH3UJJjLmEQi",
     "0Vg5CqzHEMbnRdtpwN4b65",
     "4USmJQqtSJHKiqqkdCaeZr",
     "44YQwIJ1tz4CeiyiGDvmAc",
     "3wYH2PUpODMvSHs5enNbsZ",
     "1pezmGsfm6AOd3PLvyn4rJ"]
  end
  let(:songs) { song_ids.map {|sid| s = Song.new;  s.spotify_id = sid; s } }
  let(:playlist) { Playlist.new("test playlist", songs)}

  it "creates the playlist" do
    VCR.use_cassette(:create_playlist) do
      p = Spotify::Playlist.new(playlist)
      resp = p.create_playlist
      expect(resp).to_not be_nil
    end
  end


  it "adds songs to a playlist" do
    VCR.use_cassette(:add_songs) do
      p = Spotify::Playlist.new(playlist)
      playlist_id = p.create_playlist
      expect(p.add_songs_to_playlist).to have_key "snapshot_id"
    end
  end
end

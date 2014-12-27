require 'spec_helper'

describe SpotifyPlaylistImporter::WprbParser do
  subject { SpotifyPlaylistImporter::WprbParser.new(File.read('spec/support/playlist.php')) }
  let(:first_song) { SpotifyPlaylistImporter::Song.new("Jack Dixon", "E", "E/Find Shelter", "Hotflush") }
  let(:song_count) { 22 }

  it "should parse songs" do
    expect(subject.get_songs.length).to eql(song_count) 
    expect(subject.get_songs.first.to_hash).to eql(first_song.to_hash)
  end

  it 'gets the show name' do
    expect(subject.get_show_name).to eql("The James & Andy Show with James & Andy")
  end
end

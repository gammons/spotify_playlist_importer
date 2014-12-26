require 'spec_helper'

describe WprbParser do
  subject { WprbParser.new(File.read('spec/support/playlist.php')) }
  let(:first_song) { Song.new("Jack Dixon", "E", "E/Find Shelter", "Hotflush") }
  let(:song_count) { 22 }

  it "should parse songs" do
    expect(subject.get_songs.length).to eql(song_count) 
    expect(subject.get_songs.first.to_hash).to eql(first_song.to_hash)
  end

  it 'gets the show name' do
    puts subject.get_show_name
  end
end

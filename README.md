# Spotify Playlist Importer

This is a utility gem that will help facilitate importing spotify playlists from various sources.

The idea is to take a playlist from a website, parse that playlist, and import it into Spotify.

Currently only supports parsing playlists from wprb.com, but is architected to allow developers to easily add other sources.

## Installation

Add this line to your application's Gemfile:

    gem 'spotify_playlist_importer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spotify_playlist_importer

## Usage

To generate playlists in Spotify, you must be authenticated.  This gem is expecting that Spotify.access_token is
populated with an access token that has the scopes to add and modify playlists.

```ruby
  # instantiate a parser, and feed it the page that contains the playlist.
  # the parser knows exactly how to parse out the song information.
  parser = WprbParser.new(HTTParty.get("http://wprb.com/tpm/world/printplaylist.php?show_id=33840"))

  # running get_songs will actually do the parsing and put the song data into a simple Song structure.
  # it uses a fuzzy search, so the playlist's song names, albums, etc, can vary slightly from what is on spotify.
  songs = parser.get_songs

  # create a new playlist, which is a simple structure to house the playlist's name, and list of songs.
  playlist = Playlist.new("John Solomon's Christmas special", songs)

  # you can authenticate with Spotify using their oauth routine.
  Spotify.access_token = "abcd1234"

  # Call spotify and populate the song ids for the songs in the playlist.
  Spotify::Search.new.populate_spotify_song_ids!(playlist)

  # now that we have the song ids, create the playlist on spotify.
  Spotify::Playlist.new(playlist).create!

  # and that is it!
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/spotify_playlist_importer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

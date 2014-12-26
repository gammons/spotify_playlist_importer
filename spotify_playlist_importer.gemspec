# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spotify_playlist_importer/version'

Gem::Specification.new do |spec|
  spec.name          = "spotify_playlist_importer"
  spec.version       = SpotifyPlaylistImporter::VERSION
  spec.authors       = ["Grant Ammons"]
  spec.email         = ["gammons@gmail.com"]
  spec.summary       = %q{Utilities to import playlists into spotify.  Currently parses playlists from wprb.com.}
  spec.description   = %q{Utilities to import playlists into spotify.  Currently parses playlists from wprb.com.}
  spec.homepage      = "https://github.com/gammons/spotify_playlist_importer"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'nokogiri'
  spec.add_dependency 'httparty'
  spec.add_dependency 'fuzzy_match'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "dotenv"
end

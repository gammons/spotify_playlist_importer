require 'rubygems'
require 'httparty'
require 'fuzzy_match'
require 'nokogiri'

require 'spotify_playlist_importer/playlist'
require 'spotify_playlist_importer/song'
require 'spotify_playlist_importer/version'
require 'spotify_playlist_importer/parser'
Dir["#{File.expand_path(File.dirname(__FILE__))}/spotify_playlist_importer/parsers/*.rb"].each {|file| require file }

require_relative 'spotify_playlist_importer/spotify'
Dir["#{File.expand_path(File.dirname(__FILE__))}/spotify_playlist_importer/spotify/*.rb"].each {|file| require file }

module SpotifyPlaylistImporter
end

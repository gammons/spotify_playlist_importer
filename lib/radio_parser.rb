require 'rubygems'
require 'httparty'
require 'fuzzy_match'

require_relative 'playlist'
require_relative 'song'

require_relative 'parser'
Dir["#{File.expand_path(File.dirname(__FILE__))}/parsers/*.rb"].each {|file| require file }

require_relative 'spotify'
Dir["#{File.expand_path(File.dirname(__FILE__))}/spotify/*.rb"].each {|file| require file }

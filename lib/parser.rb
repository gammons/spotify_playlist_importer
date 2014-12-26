require 'rubygems'
require 'nokogiri'
require_relative 'song'

class Parser
  attr_reader :airdate, :songs

  def initialize(doc)
    @raw = doc
    @doc = Nokogiri::HTML(doc)
    @songs = []
  end

  def get_songs
    fail "Init in subclass"
  end

  def get_show_airdate
    fail "Init in subclass"
  end
end

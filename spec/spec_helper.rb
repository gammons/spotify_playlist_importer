require 'rubygems'
require 'vcr'
require 'dotenv'
Dotenv.load

require 'spotify_playlist_importer'
require 'pry'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
end

RSpec.configure do |c|
    c.extend VCR::RSpec::Macros
end

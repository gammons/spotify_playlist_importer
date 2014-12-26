class WprbParser < Parser
  attr_reader :airdate, :songs

  def initialize(doc)
    @raw = doc
    @doc = Nokogiri::HTML(doc)
    @songs = []
  end

  def get_songs
    find_table
    get_songs_from_table
    @songs
  end

  def get_show_airdate
    @doc.at_css('p span.text').children[0].text
  end

  def get_show_name
    @doc.at_css('h2').children[0].text + @doc.search("h3").last.text
  end

  private

  def find_table
    @table = @doc.xpath('//table/tr')
  end

  def get_songs_from_table
    @table.each_with_index do |tr, index|
      next if index == 0

      artist = get_artist(tr)
      unless blank? artist
        song = Song.new(artist, get_song(tr), get_album(tr), get_label(tr))
        @songs << song
      end
    end
  end

  def get_artist(tr)
    tr.children.first.text
  end

  def get_song(tr)
    tr.children[2].children[0].text
  end

  def get_album(tr)
    tr.children[4].children[0].text
  end

  def get_label(tr)
    tr.children[6].text
  end

  def blank?(str)
    str == '' or str.nil?
  end
end



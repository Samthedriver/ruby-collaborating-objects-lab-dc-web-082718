
class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    song = self.new(filename.split(" - ")[1])
    temp_artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    song.artist = temp_artist
    song.artist.add_song(song)
    song
  end

  def artist_name=(name)
    if (self.artist.nil?)
      self.artist = Artist.new(name)
    else
      self.artist.name = name
    end
  end



end

class MP3Importer

  attr_accessor :path
  attr_reader :files

  def initialize(file_path)
    @path = file_path

    search_path = file_path + "/*.mp3"
    files = Dir[search_path]
    split_search = path + '/'
    @files = files.map do |file|
      file.split(split_search)[1]
    end

    #import

  end

  def import
    @files.each{ |filename| Song.new_by_filename(filename) }
  end
end

class Artist
  attr_accessor :name
  attr_reader :songs, :all
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    # @@all << self
  end

  # other methods
  def add_song(song)
    @songs << song
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    @@all.each do |artist|
      if artist.name == name
        return artist
      end
    end
    new_artist = self.new(name)
    new_artist.save
    new_artist
  end

  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end

  def self.class_variable_set(var, value)
    if var == "@@all"
      @@all = value
    end
  end



end

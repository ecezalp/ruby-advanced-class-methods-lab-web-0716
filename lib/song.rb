require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new_by_name(song_name)
  end

  def self.find_by_name(song_name)
    @@all.detect {|ind_song| ind_song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
       self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by! {|song| song.name}
    @@all
  end 

  def self.new_from_filename(song_filename)
    song_name = song_filename.split(" - ")[1][0...-4]
    song = self.create_by_name(song_name)
    artist = song_filename.split(" - ")[0]
    song.artist_name = artist
    song
  end

  def self.create_from_filename(song_filename)
    song = self.new_from_filename(song_filename)
  end

  def self.destroy_all
    @@all = []
  end
    
end

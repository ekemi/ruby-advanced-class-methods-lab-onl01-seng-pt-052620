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
song = Song.new
@@all << song
song
end
def self.new_by_name(song_name)
song = Song.new
song.name= song_name
song
end

def self.create_by_name(nam)
song = Song.create
song.name = nam
song
end

def self.find_by_name(song_name)

@@all.find{ |value| value.name == song_name}

end
def self.find_or_create_by_name(song_name)
  self.find_by_name(song_name)||self.create_by_name(song_name)

  end
  def self.alphabetical
    @@all.sort_by {|value| value.name}

  end

  def self.new_from_filename(file_name)
       song = self.new
       x = (file_name.split("-").join).split("  ")

       x.each do|value|
         if value == x[0]
           song.artist_name = value

        else
          y = value.split(".mp3").join
          song.name = y
        end

  end
  song
end

def self.create_from_filename(file_name)
  song = Song.new_from_filename(file_name)
  @@all << song

end

def self.destroy_all

  @@all.clear
end

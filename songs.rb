class Song
  attr_reader :name, :artist, :duration

  def initialize(name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration
  end

  def play
    puts "Playing '#{name}' by #{artist} (#{duration} mins)..."
  end

  def each_filename
    basename = "#{name}-#{artist}".gsub(' ', '-').downcase
    extensions = ['.mp3', '.wav', '.aac']
    extensions.each { |ext| yield basename + ext }
  end
end

song1 = Song.new('Okie From Muskogee', 'Merle', 5)
song2 = Song.new('Ramblin Man', 'Hank', 7)
song3 = Song.new('Good Hearted Woman', 'Waylon', 6)

class Playlist
  include Enumerable

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def each
    @songs.each { |song| yield song }
  end

  def play_songs
    each { |song| song.play }
  end

  def each_tagline
    each { |song| yield "#{song.name} - #{song.artist}" }
  end

  def each_by_artist(artist)
    select { |song| song.artist == artist }.each { |song| yield song }
  end

end

playlist = Playlist.new('My Playlist')

playlist.add_song(song1)
playlist.add_song(song2)
playlist.add_song(song3)

playlist.each { |song| song.play }

playlist.play_songs

p okie_songs = playlist.select { |song| song.name =~ /Okie/ }

p hank_songs = playlist.select { |song| song.artist =~ /Hank/ }

puts labels = playlist.map { |song| "#{song.name} #{song.artist}" }

p total_duration = playlist.map { |song| song.duration }.reduce(0, :+)

playlist.each_tagline { |tagline| puts tagline }

playlist.each_by_artist('Hank') { |song| song.play }

playlist.each_by_artist('Waylon') { |song| song.play }

song1.each_filename { |filename| puts filename }
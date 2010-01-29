
class CreateHierarchy < ActiveRecord::Migration

  def self.up
    g1 = Genre.create(:name => "Genre 1")
    g2 = Genre.create(:name => "Genre 2")
    g3 = Genre.create(:name => "Genre 3")

    a1 = Artist.create(:name => "Artist 1", :genre_id => g1.id)
    a2 = Artist.create(:name => "Artist 2", :genre_id => g1.id)
    a3 = Artist.create(:name => "Artist 3", :genre_id => g2.id)
    a4 = Artist.create(:name => "Artist 4", :genre_id => g2.id)
    a5 = Artist.create(:name => "Artist 5", :genre_id => g3.id)
    a6 = Artist.create(:name => "Artist 6", :genre_id => g3.id)

    Song.create(:title => "Song 1",  :artist_id => a1.id)
    Song.create(:title => "Song 2",  :artist_id => a1.id)
    Song.create(:title => "Song 3",  :artist_id => a2.id)
    Song.create(:title => "Song 4",  :artist_id => a2.id)
    Song.create(:title => "Song 5",  :artist_id => a3.id)
    Song.create(:title => "Song 6",  :artist_id => a3.id)
    Song.create(:title => "Song 7",  :artist_id => a4.id)
    Song.create(:title => "Song 8",  :artist_id => a4.id)
    Song.create(:title => "Song 9",  :artist_id => a5.id)
    Song.create(:title => "Song 10", :artist_id => a5.id)
    Song.create(:title => "Song 11", :artist_id => a6.id)
    Song.create(:title => "Song 12", :artist_id => a6.id)
  end

  def self.down
# you can fill this in if you want.
  end

end


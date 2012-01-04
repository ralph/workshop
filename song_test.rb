# song_test.rb
require 'minitest/autorun'
require './song.rb'

class SongTest < MiniTest::Unit::TestCase
  def test_title_setter_and_getter
    song = Song.new
    song.title = 'Wonderwall'
    assert_equal 'Wonderwall', song.title
  end

  def test_artist_setter_and_getter
    song = Song.new
    song.artist = 'Oasis'
    assert_equal 'Oasis', song.artist
  end

  def test_set_rating_to_value_between_1_and_5
    song = Song.new
    song.rating = 3
    assert_equal 3, song.rating
  end

  def test_set_rating_to_value_outside_of_1_to_5
    song = Song.new
    song.rating = 6
    assert_equal nil, song.rating
  end

  def test_set_existing_rating_to_value_outside_of_1_to_5
    song = Song.new
    song.rating = 3
    song.rating = 6
    assert_equal 3, song.rating
  end

  def test_add_related_artist
    song = Song.new
    song.add_related_artist('Blur')
    assert_equal ['Blur'], song.related_artists
  end

  def test_related_artists_is_unique
    song = Song.new
    song.add_related_artist('Blur')
    song.add_related_artist('Blur')
    assert_equal ['Blur'], song.related_artists
  end

  def test_to_hash
    song = Song.new
    song.artist = 'Oasis'
    song.title = 'Wonderwall'
    expected = {:artist => 'Oasis', :title => 'Wonderwall'}
    assert_equal expected, song.to_hash
  end

  def test_numbered_related_artists
    song = Song.new
    song.add_related_artist('Beatles')
    song.add_related_artist('Blur')
    expected = ['1) Beatles', '2) Blur']
    assert_equal expected, song.numbered_related_artists
  end

  def test_artist_set_to_empty_string
    song = Song.new
    assert_equal '', song.artist
  end

  def test_title_set_to_empty_string
    song = Song.new
    assert_equal '', song.title
  end

  def test_create
    song = Song.create({artist: 'a', title: 't'})
    assert_equal 'a', song.artist
    assert_equal 't', song.title
  end

  def test_to_param
    song = Song.new
    song.title = "The '59 Sound"
    song.artist = 'The Gaslight Anthem'
    expected = 'the-gaslight-anthem-the-59-sound'
    assert_equal expected, song.to_param
  end
end

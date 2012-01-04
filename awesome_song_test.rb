# awesome_song_test.rb
require 'minitest/autorun'
require './awesome_song.rb'

class AwesomeSongTest < MiniTest::Unit::TestCase
  def test_parent_class
    assert AwesomeSong.new.is_a?(Song)
  end

  def test_class
    assert_instance_of AwesomeSong, AwesomeSong.new
  end

  def test_awesomeness
    as = AwesomeSong.new
    as.awesomeness = 'rubylicious'
    assert_equal 'rubylicious', as.awesomeness
  end

  def test_crazyness
    as = AwesomeSong.new
    assert_equal 'super crazy', as.crazyness
  end
end

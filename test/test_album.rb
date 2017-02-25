require 'rack/test'
require 'test/unit'
require 'minitest/autorun'
require_relative '../top_albums'
require_relative '../album'

RANK = 1
TITLE = "Test Album"
YEAR = "2016"

class Top100AlbumsAppTest < Minitest::Test

  def setup
    @album1 = Album.new(RANK, TITLE, YEAR)
  end

  def test_initializes_rank_title_year_and_title_length
    assert_equal @album1.rank, RANK
    assert_equal @album1.title, TITLE
    assert_equal @album1.year, YEAR
    assert_equal @album1.title_length, TITLE.length
  end

  def test_responds_to_rank_title_year_and_title_length
    assert_respond_to(@album1,:rank)
    assert_respond_to(@album1,:title)
    assert_respond_to(@album1,:year)
    assert_respond_to(@album1,:title_length)
  end

  def test_rank_should_be_greater_than_zero
    assert_raises ArgumentError do
      Album.new(-1, TITLE, YEAR)
    end
  end

  def test_rank_should_be_less_than_101
    assert_raises ArgumentError do
      Album.new(101, TITLE, YEAR)
    end
  end

  def test_year_greater_than_0
    assert_raises ArgumentError do
      Album.new(RANK, TITLE, -1)
    end
  end

  def test_year_should_not_be_in_the_future
    assert_raises ArgumentError do
      Album.new(RANK, TITLE, 2018)
    end
  end

end
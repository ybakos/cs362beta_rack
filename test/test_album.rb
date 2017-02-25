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

end
require 'rack/test'
require 'test/unit'
require 'minitest/autorun'
require_relative '../top_albums'
require_relative '../album'


RANK = 1
TITLE = "Test Album"
YEAR = "1999"


class TopAlbumsTest < Minitest::Test
  include Rack::Test::Methods
  def app
    @app = TopAlbumsApp.new
  end

  def setup 
    @album1 = Album.new(RANK, TITLE, YEAR)
    @album2 = Album.new(2, "Another Album", "2008")
    @album_objects = []
    @album_objects.push(@album1).push(@album2)
  end

  def test_home_page_says_top_100_albums_of_all_time
    get '/'
    assert last_response.ok?
    assert last_response.body.include? "Top 100 Albums of All Time"
  end

  def test_sort_year_request_sorts_by_year
    get '/year'
    assert last_response.ok?
    assert @album_objects[0].year.to_i < @album_objects[1].year.to_i
  end

  def test_sort_albums_by_rank
    get '/rank'
    assert last_response.ok?
    assert @album_objects[1].rank > @album_objects[0].rank
  end

  def test_sort_albums_by_title_length
    get '/title_length'
    assert last_response.ok?
    assert @album_objects[1].title_length > @album_objects[0].title_length
  end

  def test_displays_albums_by_title_length_first
    get '/title_length'
    assert last_response.ok?
    assert_equal @app.album_objects[0].title, "Ten"
  end

  def test_displays_albums_by_title_length_last
    get '/title_length'
    assert last_response.ok?
    assert_equal @app.album_objects[99].title, "The Rise and Fall of Ziggy Stardust and the Spiders From Mars"
  end

end
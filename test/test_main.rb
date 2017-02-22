ENV['RACK_ENV'] = 'test'
require 'rack/test'
require 'test/unit'
require 'minitest/autorun'
require_relative '../top_albums'
require_relative '../album'


RANK = 1
TITLE = "Test Album"
YEAR = "2099"


class TopAlbumsTest < Minitest::Test
  include Rack::Test::Methods
  def app
    @app = TopAlbumsApp.new
  end

  def setup 
    @album1 = Album.new(TITLE, YEAR, RANK)
    @album2 = Album.new("Another Album", 2017, 2)
    @album_objects = []
    @album_objects.push(@album1).push(@album2)
  end

  def test_home_page_says_top_100_albums_of_all_time
    get '/'
    assert last_response.ok?
    assert last_response.body.include? "Top 100 Albums of All Time"
  end

  #NS: this test passes but I realize it really doesnt test the app
  # how would we create an instance of our app and actually assign the app
  # the new album ojects array where we can check if it is sorted or not?
  def test_sort_year_request_sorts_by_year
    get '/year'
    assert last_response.ok?
    assert @album_objects[0].year < @album_objects[1].year
  end

  def test_sort_albums_by_rank
    get '/rank'
    assert last_response.ok?
    assert @album_objects[2].rank > @album_objects[1].rank
  end

end
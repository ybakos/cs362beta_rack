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

end
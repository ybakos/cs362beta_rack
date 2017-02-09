require "rack/test"
require 'test/unit'

class Top_albums < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Top_albums.new
    puts "this is somethign"
  end

  # def test_redirect_logged_in_users_to_dashboard
  #   authorize "bryan", "secret"
  #   get "/"
  #   follow_redirect!

  #   assert_equal "http://example.org/redirected", last_request.url
  #   assert last_response.ok?
  # end

end
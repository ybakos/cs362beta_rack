require "rack/test" # Use single ticks, per convention. Also, if you use this, add the lib to the Gemfile.
require 'test/unit'

class Top_albums < Test::Unit::TestCase # Why the shit name, and why is it the same name as another class? (Hint: TopAlbumsTest)
  include Rack::Test::Methods

  def app
    Top_albums.new # Why does this class still have a shit name? :) I commented about this on GH.
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
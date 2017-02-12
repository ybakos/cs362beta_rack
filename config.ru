require_relative "top_albums" # Prefer single ticks.

# updates screen without having to kill local server and re-rackup
use Rack::Reloader
run Top_albums.new

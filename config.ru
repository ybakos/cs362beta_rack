require 'erb'

class TopAlbumsAll

	@albums = []

	def initialize
		File.open("top_100_albums.txt", "r") do |file|
			@albums = file.readlines
		end
	end

  def call(env)
  	request = Rack::Request.new(env)
  	if request.get? && request.path == "/"
  		template = File.read('index.html.erb')
  		Rack::Response.new(template)
  	else
  		Rack::Response.new("File not found", 404)
  	end
  end

  def render(template)
  	path = File.expand_path("../views/#{template}", __FILE__)
  	ERB.new(File.read(path)).result(binding)
  end

end

# updates screen without having to kill local server and re-rackup
use Rack::Reloader

run TopAlbumsAll.new

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
  		html = File.read('index.html.erb')
      rendered_html = render(html)
  		Rack::Response.new(rendered_html)
  	else
  		Rack::Response.new("File not found", 404)
  	end
  end

  def render(template)
  	ERB.new(template).result(binding)
  end

end

# updates screen without having to kill local server and re-rackup
use Rack::Reloader

run TopAlbumsAll.new

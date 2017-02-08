require 'erb'
require_relative "album"

class Top_albums
	def initialize
		File.open("top_100_albums.txt", "r") do |file|
			@albums = file.readlines
		end
		@album_objects = process_albums()
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

	def process_albums()
		album_objects = @albums.map.with_index do |d,i|
			commaSplit = d.split(",")
			Album.new(commaSplit[0], commaSplit[1], i+1)
		end
	end
end

# updates screen without having to kill local server and re-rackup
use Rack::Reloader

run Top_albums.new

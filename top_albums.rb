require 'erb'
require_relative 'album'

class TopAlbumsApp

	def initialize
		File.open("top_100_albums.txt", "r") do |file|
			@albums = file.readlines
		end
		@album_objects = process_albums
	end

  def call(env)
  	request = Rack::Request.new(env)

  	if request.get? && request.path == "/"
      sort_by_year
      send_response('index.html.erb')
    elsif request.get? && request.path == "/sort_by_album_title_length"
	    sort_by_album_title_length
	    send_response('index.html.erb')
    elsif request.get? && request.path == "/sort_by_album"
      sort_by_album
      send_response('index.html.erb')
		elsif request.get? && request.path =="/sort_by_rank"
			sort_by_rank
			send_response('index.html.erb')
		else
  		Rack::Response.new("File not found", 404)
  	end
  end

  def render(template)
  	ERB.new(template).result(binding)
	end

  def send_response(file)
    html = File.read(file)
    Rack::Response.new(render(html))
  end

	def process_albums
		@albums.map.with_index do |data, index|
			album_attributes = data.split(",")
			Album.new(index + 1, album_attributes[0], album_attributes[1])
		end
	end

  def sort_by_year
    @album_objects.sort_by! { |album| album.year }
  end

  def sort_by_album_title_length
    @album_objects.sort_by! { |album| album.title.length }
	end

	def sort_by_rank
		@album_objects.sort_by! {|album| album.rank }
	end

	def sort_by_album
		@album_objects.sort_by! { |album| album.title.downcase }
	end
end

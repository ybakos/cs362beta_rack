require 'erb'
require_relative "album" # Use single ticks.

class Top_albums # Why does this class still have a shit name? :) I commented about this on GH.

	def initialize
		File.open("top_100_albums.txt", "r") do |file|
			@albums = file.readlines
		end
		@album_objects = process_albums
	end

  def call(env)
  	request = Rack::Request.new(env)

  	if request.get? && request.path == "/"
  		html = File.read('index.html.erb') # How many times is this method duplicated in `call`? :)
      rendered_html = render(html) # And this one is never duplicated, is it? :)
  		Rack::Response.new(rendered_html) # Is the temporary variable rendered_html even necessary?

      # why so much whitespace here?

  	elsif request.get? && request.path =="/sort_year" # One space after ==
      sort_by_year
      html = File.read('index.html.erb')
      rendered_html = render(html)
      Rack::Response.new(rendered_html)
  # drunk indentation?
  elsif request.get? && request.path =="/sort_by_album_title_length" # One space after ==
	    sort_by_album_title_length
	    html = File.read('index.html.erb')
	    rendered_html = render(html)
      Rack::Response.new(rendered_html)
   # drunk indentation?
   elsif request.get? && request.path =="/sort_by_album_abc" # One space after ==
      sort_by_album_abc
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

	def process_albums() # If a method has no params, omit.
		album_objects = @albums.map.with_index do |d, i| # You don't need the variable `album_objects` at all. The block will return the array that `map` builds.
			commaSplit = d.split(",") # comma_split. Better yet, choose a better name. (Have you ever seen a "comma split"? If so, tell me what one looks like.)
			Album.new(commaSplit[0], commaSplit[1], i+1)
		end
	end

  def sort_by_year
    @album_objects.sort! { |first,second| first.year <=> second.year } # This can be even shorter. (Hint: investigate the sort method.)
  end

  def sort_by_album_title_length
	  @album_objects.sort! { |first, second| first.title.length <=> second.title.length } # This can be even shorter.
  end

  def sort_by_album_abc # Does an album have an abc? There's a better name for this that parallels the other two.
    @album_objects.sort! { |first, second| first.title.downcase <=> second.title.downcase } # This can be even shorter.
  end

end

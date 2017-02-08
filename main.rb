require 'rack'

class TopAlbumsApp

  def call(env)
    albums = []

    File.open("top_100_albums.txt","r") do |file|
      albums = file.readlines
    end

    # albums.each do |album|
    #   puts album

    ['200', {'Content-Type' => 'text/html'}, [albums.to_s]]
  end

end

Rack::Handler::WEBrick.run(TopAlbumsApp.new)


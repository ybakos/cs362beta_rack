class TopAlbumsAll
  def self.call(env)

  	albums = []
  	File.open("top_100_albums.txt", "r") do |file|
  		albums = file.readlines
  	end

    [ 200, {"Content-Type" => "text/plain"}, [albums.to_s]]
  end
end

run TopAlbumsAll
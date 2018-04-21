require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")
require_relative("../models/album.rb")
require_relative("../models/artist.rb")
require_relative("../models/genre.rb")


get "/albums" do
  @albums = Album.all()
  erb(:"albums/index")
end

get "/albums/:id" do
  @album = Album.find(params['id'].to_i)
  erb(:"albums/album")
end

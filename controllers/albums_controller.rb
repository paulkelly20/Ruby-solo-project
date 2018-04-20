require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")
require_relative("../models/album.rb")
require_relative("../models/artist.rb")


get "/albums" do
  @albums = Album.all()
  erb(:"albums/index")
end

require('sinatra')
require("sinatra/contrib/all")
require("pry-byebug")
require_relative("../models/shop.rb")
require_relative("../models/album.rb")
require_relative("../models/artist.rb")
require_relative("../models/genre.rb")


get "/sale" do
  @albums = Album.all()
  @shop = Shop.all()
  erb(:"shop/index")
end

post "/sale/buy/:id" do
 new_album = Album.find(params[:id])
 shop = Shop.all
 shop.album_sold_till_increases(new_album)
 redirect to "/sale"


end

require('sinatra')
require("sinatra/contrib/all")
require("pry-byebug")
require_relative("../models/artist.rb")
require_relative("../models/album.rb")



get "/artists" do
  @artists = Artist.all()
  @albums = Album.all()
  erb(:"artists/index")
end


get "/artists/new" do
  erb(:"artists/new")
end

post "/artists" do
  new_artist = Artist.new(params)
  new_artist.save()
  redirect to "/artists"
end

get "/artists/results" do
  @artist = Artist.keyword_search(params['search'])
  @albums = @artist.find_albums_by_artists() if @artist
  if @artist == nil
  redirect to "/artists"
  else
  erb(:"artists/show")
end


end

get "/artists/:id" do
  @artist = Artist.find(params[:id])
  @albums = @artist.find_albums_by_artists()
  erb(:"artists/show")
end

get "/artists/:id/edit" do
  @artist = Artist.find(params[:id])
  erb(:"artists/edit")
end

post "/artists/:id" do
  new_artist = Artist.new(params)
  new_artist.update()
  redirect to "/artists"
end

post "/artists/:id/delete" do
 @artist = Artist.find(params[:id])
 @artist.delete_by_id()
 redirect to "/artists"
end

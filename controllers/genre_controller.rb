require('sinatra')
require("sinatra/contrib/all")
require("pry-byebug")
require_relative("../models/genre.rb")


get "/genres" do
  @genres = Genre.all()
  @albums = Album.all()
  erb(:"genre/index")
end

get "/genres/new" do
  erb(:"genre/new")
end

post "/genres" do
  new_genre = Genre.new(params)
  new_genre.save()
  redirect to "/genres"
end

get "/genres/:id" do
  @genre = Genre.find(params[:id])

  @albums = @genre.find_albums_by_genre()
  
  erb(:"genre/show")
end

get "/genres/:id/edit" do
  @genre = Genre.find(params[:id])
  erb(:"genre/edit")
end

post "/genre/:id" do
  new_genre = Genre.new(params)
  new_genre.update()
  redirect to "/genres"
end

post "/genres/:id/delete" do
 @genre = Genre.find(params[:id])
 @genre.delete_by_id()
 redirect to "/genres"
end

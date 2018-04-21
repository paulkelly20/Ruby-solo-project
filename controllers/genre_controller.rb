require('sinatra')
require("sinatra/contrib/all")
require("pry-byebug")
require_relative("../models/genre.rb")


get "/genres" do
  @genres = Genre.all()
  erb(:"genre/index")
end

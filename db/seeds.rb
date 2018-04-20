require_relative("../models/album.rb")
require_relative("../models/artist.rb")
require("pry-byebug")

artist1 =  Artist.new({
  "name" => "Oasis",
  "type" => "Band",
  "about" => "90's Rock band from Manchester"})

artist1.save()

album1 = Album.new({
    "title" => "Whats the story morning glory",
    "artist_id" => artist1.id,
    "year" => "1998",
    "review" => "4 stars",
    "stock_level" => 4,
    "cost_price" => 5,
    "price" => 9})

album1.save()

binding.pry()
nil

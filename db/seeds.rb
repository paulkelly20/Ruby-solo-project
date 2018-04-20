require_relative("../models/album.rb")
require_relative("../models/artist.rb")
require("pry-byebug")

Album.delete_all
Artist.delete_all

artist1 =  Artist.new({
  "name" => "Oasis",
  "type" => "Band",
  "about" => "90's Rock band from Manchester"})

artist1.save()

artist2 =  Artist.new({
  "name" => "Blur",
  "type" => "Band",
  "about" => "90's Indie band from London"})
artist2.save()

album1 = Album.new({
    "title" => "Whats the story morning glory",
    "artist_id" => artist1.id,
    "year" => "1998",
    "review" => "4 stars",
    "stock_level" => 4,
    "cost_price" => 7,
    "price" => 12})

album1.save()


album2 = Album.new({
  "title" => "Parklife",
  "artist_id" => artist2.id,
   "year" => "1998",
   "review" => "4 stars",
    "stock_level" => 12,
     "cost_price" => 5,
     "price" => 9})
album2.save()

binding.pry()
nil

require_relative("../models/album.rb")
require_relative("../models/artist.rb")
require_relative("../models/genre.rb")
require("pry-byebug")

Album.delete_all()
Genre.delete_all()
Artist.delete_all()

artist1 =  Artist.new({
  "name" => "Oasis",
  "type" => "Band",
  "about" => "90's band from Manchester",
   "image" => "http://www.clashmusic.com/sites/default/files/styles/article_feature/public/legacy/files/oasis3_24.jpg?itok=lR7Vg1ZH"})

artist1.save()

artist2 =  Artist.new({
  "name" => "Blur",
  "type" => "Band",
  "about" => "90's band from London",
  "image" => "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvgFxLSpIoNuE_1oVX-3djhhwRK-VomIf0UUJ-ZzA1aXQFUyTyDA"})
artist2.save()

genre1 = Genre.new ({
  "name" => "Rock",
   "origin" => "1950s America"
  })
genre2 = Genre.new ({
  "name" => "Indie",
  "origin" => "1980s UK"
  })

  genre1.save()
  genre2.save()

album1 = Album.new({
    "title" => "Whats the story morning glory",
    "artist_id" => artist1.id,
    "year" => "1998",
    "review" => "4 stars",
    "stock_level" => 4,
    "cost_price" => 7,
    "price" => 12,
    "genre_id" => genre1.id,
     "image" => "https://upload.wikimedia.org/wikipedia/en/b/b1/Oasis_-_%28What%27s_The_Story%29_Morning_Glory_album_cover.jpg"})

album1.save()


album2 = Album.new({
  "title" => "Parklife",
  "artist_id" => artist2.id,
   "year" => "1998",
   "review" => "4 stars",
    "stock_level" => 12,
     "cost_price" => 5,
     "price" => 9,
     "genre_id" => genre2.id,
     "image" => "https://upload.wikimedia.org/wikipedia/en/7/7d/BlurParklife.jpg"})
album2.save()

binding.pry()
nil

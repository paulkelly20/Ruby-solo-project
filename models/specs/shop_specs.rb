require("minitest/autorun")
require_relative("../album.rb")
require_relative("../shop.rb")

class ShopTest < MiniTest::Test

  def setup()

    @album1 = Album.new({
        "title" => "Whats the story morning glory",
        "artist_id" => 2,
        "year" => "1995",
        "review" => "4 stars",
        "stock_level" => 4,
        "cost_price" => 7,
        "price" => 12,
        "genre_id" => 2,
        "shop_id" => 1,
         "image" => "https://upload.wikimedia.org/wikipedia/en/b/b1/Oasis_-_%28What%27s_The_Story%29_Morning_Glory_album_cover.jpg"})

         @shop1 = Shop.new ({
           "name" => "Record Planet",
           "till" => 100
           })

  end

  def test_sell_album_till_amount_goes_up()
    @shop1.album_sold_till_increases(@album1)
    assert_equal(112,@shop1.till)
  end

end

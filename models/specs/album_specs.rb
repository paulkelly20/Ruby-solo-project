require("minitest/autorun")
require_relative("../album.rb")
require_relative("../artist.rb")

class AlbumTest < MiniTest::Test

  def setup()
    @album1 = Album.new({"title" => "Whats the story morning glory",  "year" => "1998", "review" => "4 stars", "stock_level" => 4, "cost_price" => 5, "price" => 9})
    @album2 = Album.new({"title" => "Parklife",  "year" => "1998", "review" => "4 stars", "stock_level" => 12, "cost_price" => 5, "price" => 9})
  end

  def test_album()
    assert_equal("Whats the story morning glory", @album1.title)
    assert_equal("1998", @album1.year)
    assert_equal("4 stars", @album1.review)
    assert_equal(4, @album1.stock_level)
    assert_equal(5, @album1.cost_price)
    assert_equal(9, @album1.price)
  end

  def test_stock_level()
    assert_equal("Low", @album1.album_stock_level)
    assert_equal("High", @album2.album_stock_level)
  end

  def test_sell_album()
    @album1.sell_album()
    assert_equal(3, @album1.stock_level)
  end


end

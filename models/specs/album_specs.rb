require("minitest/autorun")
require_relative("../album.rb")
require_relative("../artist.rb")

class AlbumTest < MiniTest::Test

  def setup()
    @album1 = Album.new({"title" => "Whats the story morning glory",  "year" => "1998", "review" => "4 stars", "stock_level" => 4, "cost_price" => 5, "price" => 9})

  end

  def test_album()
    assert_equal("Whats the story morning glory", @album1.title)
    assert_equal("1998", @album1.year)
    assert_equal("4 stars", @album1.review)
    assert_equal(4, @album1.stock_level)
    assert_equal(5, @album1.cost_price)
    assert_equal(9, @album1.price)
  end


end

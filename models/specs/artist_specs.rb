require("minitest/autorun")
require_relative("../artist")

class ArtistTest < MiniTest::Test

  def setup
    @artist1 = Artist.new({"name" => "Oasis", "type" => "Band", "about" => "90's Rock band from Manchester"})

end

 def test_artist()
   assert_equal("Oasis", @artist1.name)
   assert_equal("Band", @artist1.type)
   assert_equal("90's Rock band from Manchester", @artist1.about)
 end




end

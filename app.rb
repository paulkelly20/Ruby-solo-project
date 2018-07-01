require( 'sinatra' )
require_relative('./controllers/artists_controller.rb')
require_relative('./controllers/albums_controller.rb')
require_relative('./controllers/genre_controller.rb')
require_relative('./controllers/invertory_controller.rb')
require_relative('./controllers/shop_controller.rb')

get "/" do
 erb (:index)

end

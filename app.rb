require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/artists_controller')
require_relative('controllers/albums_controller')
require_relative('controllers/genre_controller')

get "/" do
 erb (:index)
end

get "/results" do
  erb (:results)
end

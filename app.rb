require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/artists_controller')
require_relative('controllers/albums_controller')
require_relative('controllers/genre_controller')
require_relative('controllers/invertory_controller')

get "/" do
 erb (:index)
end

post "/results/:word" do
  @artist = Artist.keyword_search(params[:id])
  erb (:results)
end

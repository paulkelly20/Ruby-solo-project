require_relative( '../db/sqlrunner.rb' )

class Album

  attr_reader :id
  attr_accessor :title, :artist_id, :year, :review, :stock_level, :price, :cost_price, :genre_id, :image

  def initialize(options)
    @id = options["id"].to_i
    @title = options["title"]
    @artist_id = options["artist_id"]
    @year = options["year"]
    @review = options["review"]
    @stock_level = options["stock_level"].to_i
    @cost_price = options["cost_price"].to_i
    @price = options["price"].to_i
    @genre_id = options["genre_id"]
    @image = options["image"]
  end

  def save
    sql = "INSERT INTO albums (title, artist_id, year, review, stock_level, cost_price, price, genre_id, image) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9) RETURNING id;"
    values = [@title, @artist_id, @year, @review, @stock_level, @cost_price, @price, @genre_id, @image]
    result = SqlRunner.run(sql, values)
    @id = result.first["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums"
    result = SqlRunner.run(sql)
    return Album.map_albums(result)
  end

  def album_stock_level()
    if @stock_level > 10
      return "High"
    elsif @stock_level > 5
      return "Medium"
    else return "Low"
    end
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    album = SqlRunner.run(sql,values)
    result = Album.new(album.first)
    return result
  end

  def find_album_artist_from_id
    sql = "SELECT * FROM artists INNER JOIN albums ON artists.id = albums.artist_id WHERE artists.id = $1"
    values = [@artist_id]
    result = SqlRunner.run(sql,values)
    return Artist.map_artists(result)[0]
  end

  def find_album_genre_from_id
    sql = "SELECT * FROM genres WHERE id = $1"
    values = [@genre_id]
    result = SqlRunner.run(sql,values)
    return Genre.map_genres(result)[0]
  end

  def update()
    sql = "UPDATE albums SET (title, artist_id, year, review, stock_level, cost_price, price, image) = ($1, $2, $3, $4, $5, $6, $7, $8, $9) WHERE id = $10"
    values = [@title, @artist_id, @year, @review, @stock_level, @cost_price, @price, @genre_id, @image, @id]
    SqlRunner.run(sql, values)
  end


  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def delete_by_id()
    sql = "DELETE FROM albums WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def self.map_albums(albums)
    albums.map {|album| Album.new(album)}
  end

  def self.total_stock_value()
    sql = "SELECT SUM (stock_level * cost_price) AS stockvalue FROM albums;"
    result = SqlRunner.run(sql)
    return result[0]["stockvalue"].to_i
  end

  def album_markup()
    sql = "SELECT SUM (price - cost_price) AS markup FROM albums WHERE id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result[0]["markup"].to_i
  end

end

require_relative( '../db/sqlrunner.rb' )

class Album

  attr_reader :id
  attr_accessor :title, :artist_id, :year, :review, :stock_level, :price, :cost_price

  def initialize(options)
    @title = options["title"]
    @artist_id = options["artist_id"]
    @year = options["year"]
    @review = options["review"]
    @stock_level = options["stock_level"].to_i
    @cost_price = options["cost_price"].to_i
    @price = options["price"].to_i
  end

  def save
    sql = "INSERT INTO albums (title, artist_id, year, review, stock_level, cost_price, price) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id;"
    values = [@title, @artist_id, @year, @review, @stock_level, @cost_price, @price]
    result = SqlRunner.run(sql, values)
    @id = result.first["id"].to_i
  end

  def self.find()
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

  def find_by_id
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [@id]
    result = SqlRunner.run(sql,values)
    return Artist.map_albums(result)
  end

  def find_album_artist_from_id
    sql = "SELECT * FROM artists INNER JOIN albums ON artists.id = albums.artist_id WHERE artists.id = $1"
    values = [@artist_id]
    result = SqlRunner.run(sql,values)
    return Artist.map_artists(result)
  end

  def update()
   sql = "UPDATE albums SET (title, artist_id, year, review, stock_level, cost_price, price) = ($1, $2, $3, $4, $5, $6, $7) WHERE id = $8"
   values = [@title, @artist_id, @year, @review, @stock_level, @cost_price, @price, @id]
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

end

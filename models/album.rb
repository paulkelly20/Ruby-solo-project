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
end

require_relative("../db/sqlrunner.rb")

class Shop

  attr_reader :id
  attr_accessor :name, :till

  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
    @till = options["till"].to_i
  end

  def save()
    sql = "INSERT INTO shop(name, till) VALUES ($1, $2) returning id"
    values = [@name, @till]
    result = SqlRunner.run(sql, values)
    @id = result.first()["id"].to_i
  end

  def update()
    sql = "UPDATE shop SET (name, till) = ($1, $2) WHERE id = $3"
    values = [@name, @till, @id]
    SqlRunner.run(sql, values)
  end

  def album_sold_till_increases(album)
    @till += album.price
    album.sell_album
    update()

  end

  def self.all()
    sql = "SELECT * FROM shop"
    result = SqlRunner.run(sql)
    return Shop.map_shops(result)[0]
  end

  def self.map_shops(shops)
    shops.map {|shop| Shop.new(shop)}
  end

  def self.delete_all()
    sql = "DELETE FROM shop"
    SqlRunner.run(sql)
  end
end

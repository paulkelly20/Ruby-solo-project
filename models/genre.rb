require_relative("../db/sqlrunner.rb")
class Genre
  attr_reader :id
  attr_accessor :name, :origin

  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
    @origin = options["origin"]
  end

  def save()
    sql = "INSERT INTO genres (name, origin) VALUES ($1, $2) RETURNING id;"
    values = [@name, @origin]
    result = SqlRunner.run(sql, values)
    @id = result.first["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM genres"
    result = SqlRunner.run(sql)
    Genre.map_genres(result)
  end

  def self.find(id)
    sql = "SELECT * FROM genres WHERE id = $1"
    values = [id]
    genre = SqlRunner.run(sql,values)
    result = Genre.new(genre.first)
    return result
  end

  def update()
    sql = "UPDATE genres SET (name, origin) = ($1, $2) WHERE id = $3"
    values = [@name, @origin, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM genres"
    SqlRunner.run(sql)
  end

  def delete_by_id()
    sql = "DELETE FROM genres WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end


  def self.map_genres(genre_info)
    genre_info.map {|genre|Genre.new(genre)}
  end

end

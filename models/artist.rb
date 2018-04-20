require_relative( '../db/sqlrunner' )

class Artist

  attr_reader :id
  attr_accessor :name, :type, :about

  def initialize(options)
    @name = options["name"]
    @type = options["type"]
    @about = options["about"]
  end

  def save()
    sql = "INSERT INTO artists(name, type, about) VALUES ($1, $2, $3) returning id"
    values = [@name, @type, @about]
    result = SqlRunner.run(sql, values)
     @id = result.first()["id"].to_i
  end

  def self.find()
    sql = "SELECT * FROM artists"
    result = SqlRunner.run(sql)
    return Artist.map_artists(result)
  end

  def update()
   sql = "UPDATE artists SET (name, type, about) = ($1, $2, $3) WHERE id = $4"
   values = [@name, @type, @about, @id]
   SqlRunner.run(sql, values)
 end

  def find_by_id
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@id]
    result = SqlRunner.run(sql,values)
    return Artist.map_artists(result)
  end

  def delete_by_id()
    sql = "DELETE FROM artists WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end


  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def self.map_artists(artists)
    artists.map {|artist| Artist.new(artist)}
  end



end

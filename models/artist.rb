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

  # def self.delete()
  #   sql = "DELETE * FROM artists"
  #   SqlRunner.run(sql)
  # end




end

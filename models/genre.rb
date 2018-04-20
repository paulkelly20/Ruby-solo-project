require_relative("../db/sqlrunner.rb")
class Genre
  attr_reader :id
  attr_accessor :name, :origin

  def initialize(options)
    @name = options["name"]
    @origin = options["origin"]

    def save()
      sql = "INSERT INTO genres (name, origin) VALUES ($1, $2) RETURNING id;"
      values = [@name, @origin]
      result = SqlRunner.run(sql, values)
      @id = result.first["id"].to_i
    end

  end


end

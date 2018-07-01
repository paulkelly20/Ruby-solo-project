require( 'pg' )

class SqlRunner

  def self.run( sql, values = [] )
    begin
      db = PG.connect({ dbname: 'da743kghlpasci', host: 'ec2-54-217-205-90.eu-west-1.compute.amazonaws.com',
        port: 5432, user: "oxyhnutgeppaai", password:'92898e69b91942951c584b09c37886fc3bdf961107283e2f06c2bfd750f5b8b8'
        })
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close()
    end
    return result
  end

end

require( 'pg' )

class SqlRunner

  def self.run( sql, values = [] )
    begin
      db = PG.connect({ dbname: 'db7pt6in11l2vv', host: 'ec2-54-235-252-137.compute-1.amazonaws.com',
        port: 5432, user: "rynvrcghoicpky", password:'9acadf3b21a1ca82fe9a56d7400c3b2b897af5dd07ed5d5046d73ae3d3a7e178'
        })
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close()
    end
    return result
  end

end

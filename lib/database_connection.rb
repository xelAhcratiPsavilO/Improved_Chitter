require 'pg'

class DatabaseConnection

  def self.setup(dbname)
    @connection = PG.connect(ENV['DATABASE_URL'])
  end

  def self.query(query)
    @connection.exec(query)
  end
end

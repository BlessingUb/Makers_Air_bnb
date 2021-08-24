require 'pg'

class DBConnection
  def self.setup(dbname)
    PG.connect(dbname: dbname)
  end
end
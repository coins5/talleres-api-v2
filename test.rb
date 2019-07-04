require 'mysql2'
$client = Mysql2::Client.new(
  host: 'localhost',
  username: 'root',
  # password: 'mysql',
  password: '123456',
  database: 'talleresDB',
  reconnect: true
)

def queryToArray (query)
  _rows = []
  results = $client.query(query).each do |row|
    _rows.push(row)
  end
  return _rows
end

puts queryToArray("SELECT * FROM Alumno")
puts queryToArray("SELECT * FROM Alumno")
puts queryToArray("SELECT * FROM Alumno")
puts queryToArray("SELECT * FROM Alumno")
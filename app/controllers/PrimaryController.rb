require 'mysql2'

class PrimaryController
  def initialize
    pwd = getMysqlUserPassword()
    puts "USING HASH: #{pwd}"
    @client = Mysql2::Client.new(
      host: 'localhost',
      username: 'root',
      # password: 'mysql',
      password: pwd,
      database: 'talleresDB',
      reconnect: true
    )
  end

private

  def queryToArray (query)
    _rows = []
    results = @client.query(query).each do |row|
      _rows.push(row)
    end
    return _rows
  end

  def callStatement (query, *params)
    statement = @client.prepare(query)
    if (params.size == 0)
      results = statement.execute()
    else
      results = statement.execute(params)
    end
    
    _rows = []
    results.each do |row|
      _rows.push(row)
    end
    return _rows
  end

  def resultToArray (results)
    _rows = []
    results.each do |row|
      _rows.push(row)
    end
    return _rows
  end

  def validateInteger! (attr_name, attr_value)
    begin
      Integer(attr_value)
    rescue => exception
      raise "#{attr_name} debe ser integer. Valor encontrado: #{attr_value}"
    end
  end

  def getMysqlUserPassword ()
    return ENV['MYSQL_ROOT_PASSWORD'] || '123456'
  end
end

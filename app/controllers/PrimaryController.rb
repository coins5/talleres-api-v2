require 'mysql2'

class PrimaryController
  def initialize
    @client = Mysql2::Client.new(
      host: 'localhost',
      username: 'root',
      # password: 'mysql',
      password: '123456',
      database: 'talleresDB'
    )
  end

  def insert_alumno (value)
    nombre = @client.escape(value.nombre)
    apellido = @client.escape(value.apellido)
    email = @client.escape(value.email)
    password = @client.escape(value.password)

    query = 'INSERT INTO Alumno (nombre, apellido, email, password) VALUES ('
    query += "'#{nombre}', '#{apellido}', '#{email}', '#{password}');" 

    results = @client.query(query)
    return @client.affected_rows
  end

  def insert_docente (value)
    nombre = @client.escape(value.nombre)
    apellido = @client.escape(value.apellido)
    email = @client.escape(value.email)
    password = @client.escape(value.password)

    query = 'INSERT INTO Docente (nombre, apellido, email, password) VALUES ('
    query += "'#{nombre}', '#{apellido}', '#{email}', '#{password}');" 

    results = @client.query(query)
    return @client.affected_rows
  end

  def insert_taller (value)
    validateInteger!('codigo_docente', value.codigo_docente)

    nombre = @client.escape(value.nombre)
    tipoTaller = @client.escape(value.tipoTaller)
    codigo_docente = value.codigo_docente

    query = 'INSERT INTO Taller (nombre, tipoTaller, codigo_docente) VALUES ('
    query += "'#{nombre}', '#{tipoTaller}', '#{codigo_docente}');" 

    results = @client.query(query)
    return @client.affected_rows
  end

  def insert_matricula (value)
    validateInteger!('codigo_alumno', value.codigo_alumno)
    validateInteger!('codigo_taller', value.codigo_taller)

    codigo_alumno = value.codigo_alumno
    codigo_taller = value.codigo_taller

    query = 'INSERT INTO Matricula (codigo_alumno, codigo_taller) VALUES ('
    query += "#{codigo_alumno}, #{codigo_taller});" 

    results = @client.query(query)
    return @client.affected_rows
  end

  def get_alumno (id)
    validateInteger!('id', d)
    query = "SELECT codigo, nombre, apellido FROM Alumno WHERE codigo = #{id}"
    return queryToArray(query)
  end

  def get_docente (id)
    validateInteger!('id', id)
    query = "SELECT codigo, nombre, apellido FROM Docente WHERE codigo = #{id}"
    return queryToArray(query)
  end

  def get_taller (id)
    validateInteger!('id', id)
    query = "SELECT codigo, nombre, tipoTaller, codigo_docente FROM Taller WHERE codigo = #{id}"
    return queryToArray(query)
  end

  def get_matricula (codigo_alumno, codigo_taller)
    validateInteger!('codigo_alumno', codigo_alumno)
    validateInteger!('codigo_taller', codigo_taller)

    query = "SELECT codigo_alumno, codigo_taller, eval1, eval2, evalFinal FROM Matricula "
    query += "WHERE codigo_alumno = #{codigo_alumno} AND codigo_taller = #{codigo_taller}"
    return queryToArray(query)
  end

private
  def queryToArray (query)
    _rows = []
    results = @client.query(query).each do |row|
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
end

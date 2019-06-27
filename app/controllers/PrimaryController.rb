require 'mysql2'

class PrimaryController
  def initialize
    @client = Mysql2::Client.new(
      :host => 'localhost',
      :username => 'root',
      :password => 'mysql',
      :database => 'talleresDB'
    )
  end

  def insert_alumno (value)
    nombre = @client.escape(value.nombre)
    apellido = @client.escape(value.apellido)
    email = @client.escape(value.email)
    password = @client.escape(value.password)

    query = "INSERT INTO Alumno (nombre, apellido, email, password) VALUES ("
    query += "'#{nombre}', '#{apellido}', '#{email}', '#{password}');" 

    results = @client.query(query)
    return @client.affected_rows
  end

  def insert_docente (value)
    nombre = @client.escape(value.nombre)
    apellido = @client.escape(value.apellido)
    email = @client.escape(value.email)
    password = @client.escape(value.password)

    query = "INSERT INTO Docente (nombre, apellido, email, password) VALUES ("
    query += "'#{nombre}', '#{apellido}', '#{email}', '#{password}');" 

    results = @client.query(query)
    return @client.affected_rows
  end

  def insert_taller (value)
    nombre = @client.escape(value.nombre)
    tipoTaller = @client.escape(value.tipoTaller)
    #FIXME: Validar > @client.escape(value.codigo_docente)
    codigo_docente = value.codigo_docente

    query = "INSERT INTO Taller (nombre, tipoTaller, codigo_docente) VALUES ("
    query += "'#{nombre}', '#{tipoTaller}', '#{codigo_docente}');" 

    results = @client.query(query)
    return @client.affected_rows
  end

  def insert_matricula (value)

    codigo_alumno = value.codigo_alumno
    codigo_taller = value.codigo_taller

    # FIXME: Validar > string
    #codigo_alumno = @client.escape(value.codigo_alumno)
    #codigo_taller = @client.escape(value.codigo_taller)
    
    query = "INSERT INTO Matricula (codigo_alumno, codigo_taller) VALUES ("
    query += "'#{codigo_alumno}', '#{codigo_taller}');" 

    results = @client.query(query)
    return @client.affected_rows
  end

  def get_alumno (id)
    # TODO: Validar que id sea int
    query = "SELECT codigo, nombre, apellido FROM Alumno WHERE codigo = #{id}"
    return queryToArray(query)
  end

  def get_docente (id)
    # TODO: Validar que id sea int
    query = "SELECT codigo, nombre, apellido FROM Docente WHERE codigo = #{id}"
    return queryToArray(query)
  end

  def get_taller (id)
    # TODO: Validar que id sea int
    query = "SELECT codigo, nombre, tipoTaller, codigo_docente FROM Taller WHERE codigo = #{id}"
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
end
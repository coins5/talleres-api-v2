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

end
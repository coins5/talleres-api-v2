require './app/controllers/PrimaryController'
require './app/builders/AlumnoBuilder'

class AlumnoController < PrimaryController

  def createAlumno (body)
    builder = AlumnoBuilder.new
    builder.set_nombre(body['nombre'])
    builder.set_apellido(body['apellido'])
    builder.set_email(body['email'])
    builder.set_password(body['password'])

    nombre = @client.escape(builder.alumno.nombre)
    apellido = @client.escape(builder.alumno.apellido)
    email = @client.escape(builder.alumno.email)
    password = @client.escape(builder.alumno.password)

    query = 'INSERT INTO Alumno (nombre, apellido, email, password) VALUES ('
    query += "'#{nombre}', '#{apellido}', '#{email}', '#{password}');" 

    results = @client.query(query)
    return @client.affected_rows
  end

  def getAlumno (id)
    validateInteger!('id', id)
    query = "SELECT codigo, nombre, apellido FROM Alumno WHERE codigo = #{id}"
    return queryToArray(query)
  end

  def getNotasFromAlumno (id)
    validateInteger!('id', id)
    query = "CALL getNotasFromAlumno(#{id})"
    return queryToArray(query)
  end
end

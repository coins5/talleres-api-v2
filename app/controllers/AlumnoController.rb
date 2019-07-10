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

    query = 'INSERT INTO Alumno (nombre, apellido, email, password) VALUES (?, ?, ?, ?)'
    statement = @client.prepare(query)
    results = statement.execute(nombre, apellido, email, password)
    return @client.affected_rows
  end

  def getAlumno (id)
    validateInteger!('id', id)
    query = 'CALL getRB_alumnos(?)'
    statement = @client.prepare(query)
    results = statement.execute(id, id)
    return resultToArray(results)
  end

  def getNotasFromAlumno (id)
    validateInteger!('id', id)

    query = 'CALL getNotasFromAlumno(?)'
    statement = @client.prepare(query)
    results = statement.execute(id)
    return resultToArray(results)
  end

  def getNotasFromAlumno (id)
    validateInteger!('id', id)

    query = 'CALL getNotasFromAlumno(?)'
    statement = @client.prepare(query)
    results = statement.execute(id)
    return resultToArray(results)
  end
end

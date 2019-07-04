require './app/controllers/PrimaryController'
require './app/builders/DocenteBuilder'

class DocenteController < PrimaryController

  def createDocente (body)
    builder = DocenteBuilder.new
    builder.set_codigo(body['codigo'])
    builder.set_nombre(body['nombre'])
    builder.set_apellido(body['apellido'])
    builder.set_email(body['email'])
    builder.set_password(body['password'])

    nombre = @client.escape(builder.docente.nombre)
    apellido = @client.escape(builder.docente.apellido)
    email = @client.escape(builder.docente.email)
    password = @client.escape(builder.docente.password)
=begin
    query = 'INSERT INTO Docente (nombre, apellido, email, password) VALUES ('
    query += "'#{nombre}', '#{apellido}', '#{email}', '#{password}');" 

    @client.query(query)
    return @client.affected_rows
=end
    query = 'INSERT INTO Docente (nombre, apellido, email, password) VALUES (?, ?, ?, ?)'
    statement = @client.prepare(query)
    results = statement.execute(nombre, apellido, email, password)
    return @client.affected_rows
  end

  def getDocente (id)    
    validateInteger!('id', id)
=begin
    query = "SELECT codigo, nombre, apellido FROM Docente WHERE codigo = #{id}"
    return queryToArray(query)
=end
    query = 'SELECT codigo, nombre, apellido FROM Docente WHERE codigo = ?'
    statement = @client.prepare(query)
    results = statement.execute(id)
    return resultToArray(results)
  end

  def getTalleresFromDocente (id)
    validateInteger!('id', id)
    # return queryToArray("CALL getTalleresFromDocente(#{id})")
    query = 'CALL getTalleresFromDocente(?)'
    statement = @client.prepare(query)
    results = statement.execute(id)
    return resultToArray(results)
  end
end

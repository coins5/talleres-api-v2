require './app/controllers/PrimaryController'
require './app/builders/TallerBuilder'

class TallerController < PrimaryController

  def createTaller (body)
    builder = TallerBuilder.new
    builder.set_nombre(body['nombre'])
    builder.set_tipoTaller(body['tipoTaller'])
    builder.set_codigo_docente(body['codigo_docente'])

    validateInteger!('codigo_docente', builder.taller.codigo_docente)

    nombre = @client.escape(builder.taller.nombre)
    tipoTaller = @client.escape(builder.taller.tipoTaller)
    codigo_docente = builder.taller.codigo_docente

    query = 'INSERT INTO Taller (nombre, tipoTaller, codigo_docente) VALUES ('
    query += "'#{nombre}', '#{tipoTaller}', '#{codigo_docente}');" 

    results = @client.query(query)
    return @client.affected_rows
  end

  def getTaller (id)
    # return @primaryController.get_taller(id)
    validateInteger!('id', id)
    query = "SELECT codigo, nombre, tipoTaller, codigo_docente FROM Taller WHERE codigo = #{id}"
    return queryToArray(query)
  end

  def getAlumnosFromTaller (id)
    validateInteger!('id', id)

    query = "CALL getAlumnosFromTaller(#{id})"
    return queryToArray(query)
  end
end
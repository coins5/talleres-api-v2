require './app/controllers/PrimaryController'
require './app/builders/DocenteBuilder'

class DocenteController < PrimaryController
  def initialize
     @primaryController = PrimaryController.new 
  end

  def createDocente (body)
    builder = DocenteBuilder.new
    builder.set_codigo(body['codigo'])
    builder.set_nombre(body['nombre'])
    builder.set_apellido(body['apellido'])
    builder.set_email(body['email'])
    builder.set_password(body['password'])

    @primaryController.insert_docente(builder.docente)
  end

  def getDocente (id)
    return @primaryController.get_docente(id)
  end
end

require './app/controllers/PrimaryController'
require './app/builders/AlumnoBuilder'

class AlumnoController < PrimaryController
  def initialize
     @primaryController = PrimaryController.new 
  end

  def createAlumno (body)
    builder = AlumnoBuilder.new
    builder.set_codigo(body['codigo'])
    builder.set_nombre(body['nombre'])
    builder.set_apellido(body['apellido'])
    builder.set_email(body['email'])
    builder.set_password(body['password'])

    @primaryController.insert_alumno(builder.alumno)
  end
end

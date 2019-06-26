require './app/controllers/PrimaryController'
require './app/builders/MatriculaBuilder'

class MatriculaController < PrimaryController
  def initialize
     @primaryController = PrimaryController.new 
  end

  def createMatricula (body)
    builder = MatriculaBuilder.new
    #builder.set_codigo(body['codigo'])
    builder.set_codigo_alumno(body['codigo_alumno'])
    builder.set_codigo_taller(body['codigo_taller'])

    @primaryController.insert_matricula(builder.matricula)
  end
end
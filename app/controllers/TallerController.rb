require './app/controllers/PrimaryController'
require './app/builders/TallerBuilder'

class TallerController < PrimaryController
  def initialize
     @primaryController = PrimaryController.new 
  end

  def createTaller (body)
    builder = TallerBuilder.new
    #builder.set_codigo(body['codigo'])
    builder.set_nombre(body['nombre'])
    builder.set_tipoTaller(body['tipoTaller'])
    builder.set_codigo_docente(body['codigo_docente'])

    @primaryController.insert_taller(builder.taller)
  end
end
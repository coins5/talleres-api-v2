# require 'thin'
require 'sinatra'
require 'json'

require './app/controllers/AlumnoController'
require './app/controllers/DocenteController'
require './app/controllers/TallerController'
require './app/controllers/MatriculaController'

set :port, 2193

get '/' do
  'It works x)'
end

alumnoController = AlumnoController.new
docenteController = DocenteController.new
tallerController = TallerController.new
matriculaController = MatriculaController.new

post '/createAlumno' do
  __body = JSON.parse(request.body.read)
  __status = 200
  __affectedRows = 0
  begin
    __affectedRows = alumnoController.createAlumno(__body)
  rescue => exception
    __status = 412
    __message = exception.to_s
  end

  status __status
  content_type :json
  data = { :status => __status, :message => __message, :affectedRows => __affectedRows }
  body data.to_json
end

post '/createDocente' do
  __body = JSON.parse(request.body.read)
  __status = 200
  __affectedRows = 0
  begin
    __affectedRows = docenteController.createDocente(__body)
  rescue => exception
    __status = 412
    __message = exception.to_s
  end
  
  status __status
  content_type :json
  data = { :status => __status, :message => __message, :affectedRows => __affectedRows }
  body data.to_json
end

post '/createTaller' do
  __body = JSON.parse(request.body.read)
  __status = 200
  __affectedRows = 0
  begin
    __affectedRows = tallerController.createTaller(__body)
  rescue => exception
    __status = 412
    __message = exception.to_s
  end
  
  status __status
  content_type :json
  data = { :status => __status, :message => __message, :affectedRows => __affectedRows }
  body data.to_json
end

post '/createMatricula' do
  __body = JSON.parse(request.body.read)
  __status = 200
  __affectedRows = 0
  begin
    __affectedRows = matriculaController.createMatricula(__body)
  rescue => exception
    __status = 412
    __message = exception.to_s
  end
  
  status __status
  content_type :json
  data = { :status => __status, :message => __message, :affectedRows => __affectedRows }
  body data.to_json
end

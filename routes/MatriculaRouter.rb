require './app/controllers/MatriculaController'
matriculaController = MatriculaController.new

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
  data = { status: __status, message: __message, affectedRows: __affectedRows }
  body data.to_json
end

get '/getMatricula/:codigoAlumno/:codigoTaller' do
  __status = 200
  __rows = []
  begin
    __rows = matriculaController.getMatricula(params['codigoAlumno'], params['codigoTaller'])
  rescue => exception
    __status = 412
    __message = exception.to_s
  end

  status __status
  content_type :json
  data = { status: __status, message: __message, rows: __rows }
  body data.to_json
end

post '/matricula/setNota' do
  __body = JSON.parse(request.body.read)
  __status = 200
  __affectedRows = 0
  begin
    __affectedRows = matriculaController.setNota(
      __body['codigoAlumno'],
      __body['codigoTaller'],
      __body['tipoEval'],
      __body['nota']
    )
    __affectedRows = 0
  rescue => exception
    __status = 412
    __message = exception.to_s
  end
  
  status __status
  content_type :json
  data = { status: __status, message: __message, affectedRows: __affectedRows }
  body data.to_json
end
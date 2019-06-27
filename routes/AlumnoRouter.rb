require './app/controllers/AlumnoController'
alumnoController = AlumnoController.new

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

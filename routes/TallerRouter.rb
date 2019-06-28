require './app/controllers/TallerController'
tallerController = TallerController.new

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
  data = { status: __status, message: __message, affectedRows: __affectedRows }
  body data.to_json
end

get '/getTaller/:codigo' do
  __status = 200
  __rows = []
  begin
    __rows = tallerController.getTaller(params['codigo'])
  rescue => exception
    __status = 412
    __message = exception.to_s
  end

  status __status
  content_type :json
  data = { status: __status, message: __message, rows: __rows }
  body data.to_json
end

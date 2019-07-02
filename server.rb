# require 'thin'
require 'sinatra'
require 'json'

require './routes/AlumnoRouter.rb'
require './routes/DocenteRouter.rb'
require './routes/TallerRouter.rb'
require './routes/MatriculaRouter.rb'

set :port, 2193

get '/' do
  data = { status: 200, message: 'It works x)', affectedRows: 0 }
  body data.to_json
end


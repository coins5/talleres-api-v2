# require 'thin'
require 'sinatra'
require 'sinatra/cross_origin'
require 'json'

require './routes/AlumnoRouter.rb'
require './routes/DocenteRouter.rb'
require './routes/TallerRouter.rb'
require './routes/MatriculaRouter.rb'

set :port, ENV['RACK_ENV'] == 'production' ? 80 : 2193

# Habilitando CORS
# https://medium.com/addval-labs/adding-cors-configuration-to-a-sinatra-app-1ed426e2c028

configure do
  enable :cross_origin
end
before do
  response.headers['Access-Control-Allow-Origin'] = '*'
end

options "*" do
  response.headers["Allow"] = "GET, PUT, POST, DELETE, OPTIONS"
  response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
  response.headers["Access-Control-Allow-Origin"] = "*"
  200
end


get '/' do
  data = { status: 200, message: 'It works x)', affectedRows: 0 }
  body data.to_json
end

# Set environment variables for production:
# RACK_ENV=production
# MYSQL_ROOT_PASSWORD=strong_password

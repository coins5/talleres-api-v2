require 'sinatra'
require 'json'

set :port, 2193

get '/' do
  'Hello world!'
end

get '/foo' do
  status 200
  content_type :json
  data = { :key1 => 'value1', :key2 => 'value2' }
  data2 = ["asdasd", "asdddd", "cccc"]
  body data2.to_json
end
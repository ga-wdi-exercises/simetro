require 'sinatra'
require 'sinatra/reloader'
require_relative 'metro'

get '/' do
  @lines = metro.keys
  erb :index
end

# get '/' do
#   1 # must be "1"
# end


get '/start' do
  params[:line]
  @stations = metro[params[:line].to_sym]
  erb :start
end

get '/end' do
  @stations = metro[params[:line].to_sym]
  erb :end
end

get '/trip' do
start_trip = params[:start]
end_trip = params[:end]
line = params[:line].to_sym

start_index = metro[line].find_index(start_trip)
end_index = metro[line].find_index(end_trip)

num_stops = end_index - start_index
return num_stops.to_s

end

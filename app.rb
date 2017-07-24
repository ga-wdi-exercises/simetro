require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require_relative 'metro'

get '/' do
  @lines = metro.keys
  erb :index
end

get '/start' do
  line = params[:line]
  @stations = metro[line.to_sym]
  erb :start
end

get '/end' do
  @stations = metro[params[:line].to_sym]
  erb :end
end

# get '/start/:start_station' do
#   @start_station = metro[params[:start_station].to_sym]
#   # return "#{start_station}"
# end

get '/trip' do
  stations = metro[params[:line].to_sym]
  first = stations.index(params[:start])
  last = stations.index(params[:end])
  distance = last - first
  if distance < 0
  return "#{distance * -1}"
else
  return "#{distance}"
end
end

# binding.pry
# puts "end of file"

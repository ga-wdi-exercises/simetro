require 'sinatra'
require 'sinatra/reloader'
require_relative 'metro'

get '/' do
  @lines = metro.keys
  erb :index
end

get '/start' do
  params[:line]
  @stations = metro[params[:line].to_sym]
  erb :start
end

get '/end' do
  @stations = metro[params[:line].to_sym]
  erb :end
end

# get '/start/:start_station' do
#   @start_station = params[:start_station]
# end
#
# get '/end/:end_station' do
#   @end_station = params[:end_station]
# end

get '/trip' do
    stations = metro[params[:line].to_sym]
    first = stations.index(params[:start])
    last = stations.index(params[:end])
    distance = first - last
    return "#{distance}"
end

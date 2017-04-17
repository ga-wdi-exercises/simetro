require 'sinatra'
require 'sinatra/reloader'
require_relative 'metro'


get '/' do
  @lines = metro.keys
  erb :index
end
#
get '/start' do
  params[:line]
  @stations = metro[params[:line].to_sym]
  erb :start
end
#
get '/end' do
  @stations = metro[params[:line].to_sym]
  erb :end
end


get '/trip' do
  line = metro[params[:line].to_sym]
  @num_stops = (line.find_index(params[:start]) - line.find_index(params[:end])*(-1))
  erb :trip
end

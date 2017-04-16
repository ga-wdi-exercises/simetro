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
  #  "Starting at #{params[:start]} and ending at #{params[:end]}"
  #  @start_stop = params[:start].to_sym)
  #  @end_stop =
  erb :trip
end

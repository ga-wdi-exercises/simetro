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

get '/trip' do
  @stations = metro[params[:line].to_sym]
  @start = @stations.index(params[:start])
  @end = @stations.index(params[:end])
  @num_stops = (@end.to_i - @stop.to_i).abs 
  erb :trip

end

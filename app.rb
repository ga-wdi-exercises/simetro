require 'sinatra'
require 'sinatra/reloader'
require_relative 'metro'

get '/' do
  @lines = metro.keys
  erb :index
end

get '/trip' do
  @stations = metro[params[:line].to_sym]
  @start_station = @stations.index(params[:start]).to_i
  @end_station = @stations.index(params[:end]).to_i
  @num_stops = @end_station - @start_station
  erb :trip
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

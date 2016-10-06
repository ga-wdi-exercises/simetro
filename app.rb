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
start_index = metro[params[:line].to_sym].index params[:start]
end_index = metro[params[:line].to_sym].index params[:end]
@num_stops = (end_index -  start_index).abs - 1
erb :trip
end

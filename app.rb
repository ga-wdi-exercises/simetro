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
  @start = params[:start]
  @stop = params[:end]
  line = params[:line].to_sym
  start_index = metro[line].find_index(@start).to_i
  stop_index = metro[line].find_index(@stop).to_i
  @num_stops = stop_index - start_index
  @num_stops = @num_stops.to_s
  erb :trip
end

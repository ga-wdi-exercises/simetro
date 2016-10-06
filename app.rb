require 'sinatra'
require 'sinatra/reloader'
require_relative 'metro'

get '/' do
  @lines = metro.keys
  erb :index
end

get '/trip' do
  line = metro[params[:line].to_sym]
  last = line.index(params[:start])
  start = line.index(params[:end])
  @num_stops = (start - last)
  @num_stops.to_s
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

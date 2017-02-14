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
  line = metro[params[:line].to_sym]
  start = line.index(params[:start])
  stop = line.index(params[:end])
  @num_stops = (start - stop).abs.to_s
  erb :trip
end

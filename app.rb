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
  start = line.index(params[:end])
  last = line.index(params[:start])
  @num_stops = (start - last).abs.to_s
  erb :trip
end

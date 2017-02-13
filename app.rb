require 'sinatra'
require 'sinatra/reloader'
require_relative 'metro'

get '/' do
  @lines = metro.keys
  erb :index
end

get '/trip' do
  line = metro[params[:line].to_sym]
  starting_point = line.index(params[:start])
  ending_point = line.index(params[:end])
  @num_stops = (starting_point - ending_point).abs
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

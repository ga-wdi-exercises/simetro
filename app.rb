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
  line = metro[ params[:line].to_sym ]
  puts "*" * 50
  puts line
  start_location = params[:start]
  start_index = line.index start_location
  puts "*" * 50
  puts start_index
  end_location = params[:end]
  end_index = line.index end_location
  puts "*" * 50
  puts end_index
  @num_stops = (end_index - start_index)
  puts @num_stops
  erb :trip
end

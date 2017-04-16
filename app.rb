require 'sinatra'
require 'sinatra/reloader'
require_relative 'metro'

get '/' do
  @lines = metro.keys
  erb :index
end

get '/start' do
  @line = params[:line]
  @stations = metro[params[:line].to_sym]
  erb :start
end

get '/end' do
  @stations = metro[params[:line].to_sym]
  erb :end
end

get '/trip' do

line = metro[params[:line].to_sym]
start_station = params[:start]
start_index = line.find_index(start_station)
return start_index.to_s
end

puts @start_station
puts @end_station

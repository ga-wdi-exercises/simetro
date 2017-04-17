require 'sinatra'
require 'sinatra/reloader'
require_relative 'metro'

get '/' do
  @lines = metro.keys
  erb :index
end

get '/' do
  1
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
# puts "hello world"
  line = metro[params[:line].intern]
  first_station = params[:start]
  first_index = line.find_index(first_station)

  last_station = params[:end]
  last_index = line.find_index(last_station)

#trying to ensure that we get the number of stops and not get negative stops.  So we choose the larger of the two(first index vs last index) and subtract the smaller from the larger
stops =
  last_index - first_index if last_index > first_index
  first_index - last_index if last_index < first_index


@num_stops = stops.to_s
  # return first_index.to_s
  erb :trips
end

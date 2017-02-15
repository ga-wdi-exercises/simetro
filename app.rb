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
     # to_sym converts a string to a symbol:
    line = metro[params[:line].to_sym]
    # using .index, set the starting station from :line :
    start = line.index(params[:start])
    # set the end station from :line :
    last_station = line.index(params[:end])
    # get number of stops:
  @num_stops = ((last_station - start).abs).to_s
  erb :trip
end

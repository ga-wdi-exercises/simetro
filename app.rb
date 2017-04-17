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
  @line = params[:line]
  @start_station = params[:start]
  @start_station_index = metro[@line.to_sym].index("#{@start_station}")
  @end_station = params[:end]
  @end_station_index = metro[@line.to_sym].index("#{@end_station}")
  num_stops = (@start_station_index - @end_station_index).abs
  @num_stops = num_stops.to_s
  erb :trip
end

require 'sinatra'
require 'sinatra/reloader'
require_relative 'metro'




get '/' do
  @lines = metro.keys
  @chosen_line = params[:line]
  @start_index = metro.index(@chosen_line)
  puts @start_index
  @start_station = params[:start]
  erb :index
end

get '/start' do
  @stations = metro[params[:line].to_sym]
  @start_station_index = metro.start_index.index(@start_station)
  erb :start
end
# #
# get '/end' do
#   @stations = metro[params[:line].to_sym]
#   @end_station = params[:end]
#   @end_station_index = metro.start_index.index(@end_station)
#
#   erb :end
# end
# #
# get '/trip' do
#   @num_stops = @end_station_index - @start_station_index
#   erb :trip
# end

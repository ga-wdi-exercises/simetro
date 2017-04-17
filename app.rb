require 'sinatra'
require 'sinatra/reloader'
require_relative 'metro'

require 'pry'

#Two things learned:
#
# params =
#   {:mode => mode, :id => id, :new => new}

get '/' do
  @lines = metro.keys
  erb :index
end

get '/start' do
  @stations = metro[params[:line].to_sym]
  erb :start
end
# #
get '/end' do
  @stations = metro[params[:line].to_sym]
  erb :end
end
# #
get '/trip' do
  @start_station = params[:start]
  @end_station = params[:end]
  @line_chosen = metro[params[:line].to_sym]
  binding.pry
  #find_index
  first_index = @line_chosen.index(@start_station)
  last_index = @line_chosen.index(@end_station)
  # end_station_index = @chosen_line_complete.each_with_index do |stop, index|
  # if stop == @end_station return index
  # end
  @num_stops = last_index - first_index
  erb :trip
end

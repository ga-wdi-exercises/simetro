require 'sinatra'
require 'sinatra/reloader'
require_relative 'metro'


# params =
#   {:mode => mode, :id => id, :new => new}

get '/' do
  @lines = metro.keys
  erb :index
end

get '/start' do
  @chosen_line = params[:line]
  @remove_quotes = params[:line].chomp('"').reverse.chomp('"').reverse
  @chosen_line_complete = metro[:@remove_quotes]
  puts "This is the line: #{@chosen_line}"
  puts "What is this? #{@chosen_line_complete}"
  @start_station = params[:start]
  @stations = metro[params[:line].to_sym]
  # @start_station_index = metro.start_index.index(@start_station)
  erb :start
end
# #
get '/end' do
  @stations = metro[params[:line].to_sym]
  puts "This is the start station #{@start_station}"
  @end_station = params[:end]
  erb :end
end
# #
# get '/trip' do
#   @num_stops = @end_station_index - @start_station_index
#   erb :trip
# end

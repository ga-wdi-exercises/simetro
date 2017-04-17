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
  #made a puts statement to see if the variable would pull through to access the line in the metro hash
  #puts "What is this? #{@chosen_line_complete}"

  @stations = metro[params[:line].to_sym]
  # @start_station_index = metro.start_index.index(@start_station)
  erb :start
end
# #
get '/end' do
  @start_station = params[:start]
  #find index of station
  start_station_index = @chosen_line_complete.each_with_index do |stop|
    if stop = @start_station return index
  end
  @stations = metro[params[:line].to_sym]
  puts "This is the start station #{@start_station}"
  erb :end
end
# #
get '/trip' do
  @end_station = params[:end]
  end_station_index = @chosen_line_complete.each_with_index do |stop|
  if stop = @end_station return index
  end
  @num_stops = @end_station_index - @start_station_index
  erb :trip
end

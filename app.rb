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
  # @start_index = @line.find_index(@start)
  # @stop_index = @line.find_index(@end)
  # # stop_index = metro.find_index{|x| x(line) == end_of_line}
  # @num_stops = abs(start_index - stop_index)
  @start = params[:start]
  @stop = params[:end]
 # line = params[:line].to_sym
  @start_index = metro[params[:line].to_sym].find_index(@start)
  @stop_index = metro[params[:line].to_sym].find_index(@stop)
  @num_stops = (@stop_index.to_i - @start_index.to_i).abs.to_s
  # @num_stops = @num_stops.to_s
 erb :trip
end

# get '/trip' do
#   stations = metro[params[:line].to_sym]
#  first = stations.index(params[:start])
#  last = stations.index(params[:end])
#  @distance = last.to_i - first.to_i
#  erb :trip
# end

require 'sinatra'
require 'sinatra/reloader'
require_relative 'metro'

get '/' do
  @lines = metro.keys
  erb :index
end

# get '/' do
#   1 # must be "1"
# end


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
  @start_station = params[:start]
  @end_station = params[:end]
  @line = params[:line].to_sym

  start_index = metro[@line].find_index(@start_station)
  end_index = metro[@line].find_index(@end_station)

  @num_stops = end_index - start_index
  erb:trip

end

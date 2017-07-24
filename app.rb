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

# metro.index(params[:line])

get '/trip' do
  start_stop = params[:start]
  end_stop = params[:end]
  line = params[:line].to_sym
  start_index = metro[line].find_index(start_stop)
  end_index = metro[line].find_index(end_stop)
  @num_stops = (start_index.to_i - end_index.to_i)
  if @num_stops < 0
    @num_stops = @num_stops * -1
  end
  @num_stops = @num_stops.to_s
  erb :trip
end

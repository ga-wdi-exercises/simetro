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
  line = metro[ params[:line].to_sym]
  start_location = params[:start]
  start_index = line.index start_location
  end_location = params[:end]
  @num_stops = (start.abs.to_s)
  erb

end

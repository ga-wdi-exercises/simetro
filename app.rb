require 'sinatra'
require 'sinatra/reloader'
require_relative 'metro'

get '/trip' do
  lines = metro[params[:line].to_sym]
  puts "*" *50
  puts line
  start_location = params[:start]
  start_index = line.index start_location
  puts start_index
  end_location = params[:end]
  end_index = line.index end_location
  puts "*" 50
  puts end_index
  @num_stops
  erb :trip
end

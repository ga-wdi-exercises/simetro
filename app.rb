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
  @line = metro[params[:line].to_sym] # get the metro line
  @end_index = @line.index(params[:end]) # get the ending index
  @start_index = @line.index(params[:start]) # get the starting index
  @num_stops = (@end_index - @start_index).abs.to_s
  erb :trip
end

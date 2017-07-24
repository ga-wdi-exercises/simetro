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
  @start = params[:start]
  @end = params[:end]
  @line = metro[params[:line].to_sym]
  @start_index = @line.find_index(@start)
  @end_index = @line.find_index(@end)
  @num_stops = (@start_index - @end_index).abs
  erb :trip
end

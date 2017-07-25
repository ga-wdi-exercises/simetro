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
  @stop = params[:end]
  @start_index = metro[params[:line].to_sym].find_index(@start)
  @stop_index = metro[params[:line].to_sym].find_index(@stop)
  @num_stops = (@stop_index.to_i - @start_index.to_i).abs
  erb :trip
end

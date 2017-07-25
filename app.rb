require 'sinatra'
require 'sinatra/reloader'
require_relative 'metro'

get '/' do
  @lines = metro.keys
  erb :index
end

get '/start' do
  @stations = metro[params[:line].to_sym]
  erb :start
end

get '/end' do
  @stations = metro[params[:line].to_sym]
  erb :end
end

get '/trip' do
@stations = metro[params[:line].to_sym]
  @start = params[:start]
  @end = params[:end]
  @num_stops = (@station.find_index(@start)-@station.find_index(@end)).abs
  erb :trip
end

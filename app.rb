require 'sinatra'
require 'sinatra/reloader'
require_relative 'metro'

get '/' do
  @lines = metro
  erb :index
end

get '/start' do
  @lines = metro
  erb :start
end

get '/end' do
  @lines = metro
  erb :end
end

get '/trip' do
  @stations = metro[params[:line].to_sym]
  @start = params[:start]
  @end = params[:end]
  @num_stops = (@stations.find_index(@start)-@stations.find_index(@end)).abs
  erb :trip
end

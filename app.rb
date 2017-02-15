require 'sinatra'
require 'sinatra/reloader'
require_relative 'metro'

get '/' do
  @lines = metro.keys
  erb :"metro/index"
end

get '/trip' do
  @line = params[:line]
  @stations = metro[params[:line].to_sym]
  @start = params[:start]
  @end = params[:end]
  @num_stops = (@stations.index(@start)- @stations.index(@end)).abs
  erb :"metro/trip"
end

get '/start' do
  params[:line]
  @stations = metro[params[:line].to_sym]
  erb :"metro/start"
end

get '/end' do
  @stations = metro[params[:line].to_sym]
  erb :"metro/end"
end

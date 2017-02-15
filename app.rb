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
  params[:line]
  @stations = metro[params[:line].to_sym]
  erb :end
end

get '/trip' do
  params[:line]
  @stations = metro[params[:line].to_sym]
  params[:start]
  @start =  metro[params[:start].to_sym]
  params[:end]
  @end =   metro[params[:end].to_sym]
  # @num_stops = (@stations.index(@end) + @stations.index(@start))  
  erb :trip
end

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
  @start = @stations.index(params[:start])
  params[:end]
  @end =  @stations.index(params[:end])
  @num_stops = @end + @start
  erb :trip
end

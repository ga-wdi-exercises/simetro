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
  @stations = metro[params[:line].to_sym]
  @num_stations = (@stations.find_index(params[:end])).to_i - (@stations.find_index(params[:start])).to_i
  erb :trip
end

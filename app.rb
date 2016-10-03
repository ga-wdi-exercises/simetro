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
  @start = params[:start].to_s
  @end = params[:end].to_s
  @num_stops = (metro[params[:line].to_sym].find_index(params[:start].to_s) - metro[params[:line].to_sym].find_index(params[:end].to_s)).abs - 1
  erb :trip
end

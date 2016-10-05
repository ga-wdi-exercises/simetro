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
@num_stops = metro[params[:line].to_sym].index(@end) - metro[params[:line].to_sym].index(@start)
erb :trip
end

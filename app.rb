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
  get_first_stop = params[:start]
  get_last_stop = params[:end]
  first_stop = metro[params[:line].to_sym].index(get_first_stop)
  last_stop = metro[params[:line].to_sym].index(get_last_stop)
  @num_stops = last_stop - first_stop
  erb :trip
end

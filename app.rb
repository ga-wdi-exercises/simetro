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
  last_stop = (metro[params[:line].to_sym].index(params[:end]))
  start = (metro[params[:line].to_sym].index(params[:start]))
  @number_of_stops = (start - last_stop).abs
  erb :trip
end

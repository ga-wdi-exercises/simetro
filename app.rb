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

get '/trip' do
  trip = metro[params[:line].to_sym]
  start = trip.index(params[:start])
  finish = trip.index(params[:end])
  @num_stops = (finish-start).abs
  erb :trip
end

get '/end' do
  @stations = metro[params[:line].to_sym]
  erb :end
end

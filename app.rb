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
  #bring array of a line in
  trip = metro[params[:line].to_sym]
  #designate a start and finish
  start = trip.index(params[:start])
  finish = trip.index(params[:end])
  #math for number of stops probably goes here (finish-start)
  @num_stops = (finish - start).abs
  erb :trip
end

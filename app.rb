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
  start = metro[params[:line].to_sym].index(params[:start].to_s)
  ending = metro[params[:line].to_sym].index(params[:end].to_s)
  @num_stops = (start - ending).abs.to_s
  erb :trip
end

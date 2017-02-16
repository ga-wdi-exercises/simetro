require 'sinatra'
require 'sinatra/reloader'
require_relative 'metro'

get '/' do
  @lines = metro.keys
  erb :index
end

get '/trip' do
  line = metro[params[:line].to_sym]
  metrostart = line.inex(params[:start])
  metroend = line.inex(params[:end])
  @num_stops = (metrostart - metroend).abs.to_s
  erb :trip
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

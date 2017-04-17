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
  @num_stops = ((start[params[index].to_i])-(metro[params[index].to_i]))
end

get '/end' do
  @stations = metro[params[:line].to_sym]
  erb :end
end

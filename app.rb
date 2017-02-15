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
  @line = metro[params[:line].to_sym]
  @start = @line.index(params[:start])
  @end = @line.index(params[:end])
  @num_stops = @end - @start
  erb :trip
end

get '/end' do
  @stations = metro[params[:line].to_sym]
  erb :end
end

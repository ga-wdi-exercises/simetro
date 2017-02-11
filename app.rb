require 'sinatra'
require 'sinatra/reloader'
require_relative 'metro'

get '/' do
  @lines = metro.keys
  erb :index
end

get '/start' do
  @stations = metro[params[:line].to_sym]
  erb :start
end

get '/end' do
  @stations = metro[params[:line].to_sym]
  erb :end
end

get '/trip' do
  @stations = metro[params[:line].to_sym]
  @i = @stations.index(params[:start])
  @j = @stations.index(params[:end])
  "#{(@i - @j).abs}"
end

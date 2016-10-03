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
  @var = params[:start]
  @distance = (metro[params[:line].to_sym].index(params[:start]) - metro[params[:line].to_sym].index(params[:end])).abs
  erb :trip
end

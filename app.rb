require 'pry'
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
  start = metro[params[:line].to_sym].index(params[:start])
  finish = metro[params[:line].to_sym].index(params[:end])
  @num_stops = (finish - start).abs
  binding.pry
  erb :trip
end

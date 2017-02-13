require 'sinatra'
require 'sinatra/reloader'
require_relative 'metro'
# require 'pry'

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
  line = metro[params[:line].to_sym]
  last = line.index(params[:start])
  # puts @start.to_s
  start = line.index(params[:end])
  # puts @end.to_s
  @num_stops = ((last - start).abs).to_s
  # @num_stops.to_s
  erb :trip
end

# binding.pry

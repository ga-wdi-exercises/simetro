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
  puts params[:line]
  # find the index of using .index, then put in variable
  puts params[:start]
  # find the index of, then put in variable
  #@num_stops will the difference
  puts params[:end]
  # @num_stops = metro[ params[:line] [:start].to_i] - metro[params[:line][:end].to_i]
  metro_line = metro[params[:line].to_sym]
  start = metro_line.index(params[:start])
  destination = metro_line.index(params[:end])

  @num_stops = ((destination - start).abs).to_s

  erb :trip
end

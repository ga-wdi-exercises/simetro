require 'sinatra'
require 'sinatra/reloader'
require_relative 'metro'

get '/' do
  @lines = metro.keys
  erb :index
end

get '/start' do
  params[:line]
  @starting_station = metro[params[:line].to_sym]
  erb :start
end


get '/end' do
  @ending_station = metro[params[:line].to_sym]
  erb :end
end

get '/trip' do
  @line = metro[params[:line].to_sym]

  # index of starting station
  @start = params[:start]
  # index of ending station
  @end = params[:end]

  # @num_stops =
  erb :trip
end

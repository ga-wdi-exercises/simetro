require 'sinatra'
require 'sinatra/reloader'
require_relative 'metro'

@num_stops = []
if params[:start] - params[:end] == 0
	@num_stops << params[:start].to_i = erb: trip_info
else
	@num_stops << params[:end].to_i = erb: trip_info



get '/' do]
  @num_stops
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
	erb: trip_info
end

get '/trip_plus' do
	erb: trip_plus
end

get '/trip_wind' do
	erb: trip_minus
end
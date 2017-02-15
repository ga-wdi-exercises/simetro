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
	params[:line]
	@stations = metro[params[:line].to_sym]
	$starts = @stations.index(params[:start])
	$ends = @stations.index(params[:end])
	@num_stops = ($starts - $ends).abs.to_s 
	erb :trip
end

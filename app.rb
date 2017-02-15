require 'sinatra'
require 'sinatra/reloader'
require_relative 'metro'

get '/' do
  @lines = metro.keys
  erb :index
end

get '/trips' do
	@num_stop = @staions[0]

get '/start' do
  params[:line]
  @stations = metro[params[:line].to_sym]
  @startStation = metro[params[:line]]
  erb :start
end

get '/end' do
  @stations = metro[params[:line].to_sym]
  @endStation = metro[params[:line]]
  erb :end
end

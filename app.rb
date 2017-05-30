require 'sinatra'
require 'sinatra/reloader'
require_relative 'metro'

get '/' do
  @lines = metro.keys
  erb :index
end

get '/trip' do
  @line = metro[params[:line].to_sym]
  @start = params[:start]
  @ends = params[:end]
  @num_stops = @line.index(@ends) - @line.index(@starts)
  erb :trip
end


get '/start' do
  params[:line]
  @start = metro[params[:line].to_sym]
  erb :start
end

get '/end' do
  @end = metro[params[:line].to_sym]
  erb :end
end

require 'sinatra'
require 'sinatra/reloader'
require_relative 'metro'

get '/' do
  @lines = metro.keys
  chosenLine= params[:line]
  erb :index
end

get '/start' do
  params[:line]
  erb :start
  @stations = metro[params[:line].to_sym]
  @startingstation= chosenLine.index(@stations).to_i
end

get '/end' do
  @stations = metro[params[:line].to_sym]
  @finalstation=chosenLine.index(@stations).to_i
  erb :end
end
get '/trip' do
  erb :trip
  @num_stops=@startingstation-@finalstation
end

require 'sinatra'
require 'sinatra/reloader'
require_relative 'metro'

get '/' do
  @lines = Lines.keys
  erb :index
end

get '/start' do

  @stations = Station[params[:line].to_sym]
  erb :start
end

get '/end' do
  @stations = Station[params[:line].to_sym]
  erb :end
end

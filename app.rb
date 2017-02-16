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

get "/trip" do
  metro_line = metro[params[:line].to_sym]
  start = metro_line.index(params[:start])
  stop = metro_line.index(params[:end])
  @num_stops = ((stop - start).abs).to_s
  erb :trip

end

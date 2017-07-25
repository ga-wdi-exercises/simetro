require 'sinatra'
require 'sinatra/reloader'
require_relative 'metro'

get '/' do
  @lines = metro.keys
  erb :index

end

get '/start' do
  puts "hi over there"
  params[:line]
  @stations = metro[params[:line].to_sym]
  erb :start
end

get '/end' do
  @stations = metro[params[:line].to_sym]
  puts params[:start]
  erb :end
end


get '/trip' do

 @stations = metro[params[:line].to_sym]

 @pos1 =params[:start]
 @pos2 =params[:end]


@initial = @stations.find_index(@pos1)


@final = @stations.find_index(@pos2)

@num_stops = @final - @initial

erb :trip

end

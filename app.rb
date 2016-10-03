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
  @line = params[:line].to_sym
  @start = params[:start].to_s
  @end = params[:end].to_s
  @indexStart = metro[@line].index(@start)
  @indexEnd = metro[@line].index(@end)
  @numStops = (@indexEnd - @indexStart).abs

  # @x = metro[@line]
  # @startIndex = metro[params[:line].to_s].index(params[:start].to_s)

  # "#{@startIndex} hello"

  x = metro[:"red"].index("Bethesda")
  # x = metro.index(params:line)
  erb :trip
end

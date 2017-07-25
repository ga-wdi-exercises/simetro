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



# def total_length (color1, name1, color2, name2)
#
# @pos1 = metro[color1.to_sym].index_of(name1)
#
# @pos2 = metro[color2.to_sym].index_of(name2)
#
#
# @break_point1 =0
# @break_point2 =0
#
#
# metro[color1.to_sym].times do |index|
#   x = metro[color2.to_sym][index].find{|name| name == name1}
#   if(x!=NilClass)
#   break_point1 = metro[color1.to_sym].index_of(x)
#   end
# end




get '/trip' do

 @stations = metro[params[:line].to_sym]

 @pos1 =params[:start]
 @pos2 =params[:end]


@initial = @stations.find_index(@pos1)


@final = @stations.find_index(@pos2)

@num_stops = (@final - @initial).abs

erb :trip

end

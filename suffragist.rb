require 'sinatra'
require 'yaml/store'
require './eyeshadow'

get '/' do
  @title = 'Show me the Sparkle!'
  erb :index
end

get '/results' do
  @title = 'Shadows so far:'

  erb :results ,locals: {eyeshadows: Eyeshadow.all}
end

post '/cast' do
  @title = 'Thanks for adding more sparkles!!'
  p params['name']
  p params['color']
  @eyeshadow = Eyeshadow.new(params['name'], params['color'])
  @eyeshadow.save
  erb :cast
end

# Shadows = Struct.new :name, :color
# Colors = {
#     :r => 'red'
#     :ro => 'red-orange'
#     :o => 'orange'
#     :yo => 'yellow-orange'
#     :y => 'yellow'
#     :yg => 'yellow-green'
#     :g => 'green'
#     :bg => 'blue-green'
#     :b => 'blue'
#     :bp => 'blue-purple'
#     :p => 'purple'
#     :rp => 'red-purple'
# }
#
# Choices = {
#   'HAM' => 'Hamburger',
#   'PIZ' => 'Pizza',
#   'CUR' => 'Curry',
#   'NOO' => 'Noodles',
# }

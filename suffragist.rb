require 'sinatra'
require 'yaml/store'

get '/' do
  @title = 'Show me the Sparkle!'
  erb :index
end

get '/results' do
  @title = 'Results so far:'
  @store = YAML::Store.new 'eyeshadows.yml'
  @name = @store.transaction { @store['name'] }
  erb :results
end

post '/cast' do
  @title = 'Thanks for casting your vote!'
  #@vote  = params['vote']
  @name = params['name']
  p @name
  @store = YAML::Store.new 'eyeshadows.yml'
  @store.transaction do
    @store['name'] ||= {}
    #@store['name'][@name] ||= 0
  end
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

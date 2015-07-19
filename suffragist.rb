require 'sinatra'
require 'yaml/store'
require 'dragonfly'
require 'openssl'
require_relative 'eyeshadow'

# require_relative 'photo'

class Photo
  attr_accessor :image_uid
  extend Dragonfly::Model
  dragonfly_accessor :image
end

Dragonfly.app.configure do
  # plugin :imagemagick
  url_format '/media/:job'
  secret 'blups'
end

use Dragonfly::Middleware

get '/' do
  @title = 'Show me the Sparkle!'
  erb :index
end

get '/results' do
  @title = 'Results so far:'
  @store = YAML::Store.new 'eyeshadows.yml'
  @casts = @store.transaction { @store['casts'] || [] }
  @companys = []
  @casts.each do |cast|
    @companys.push(cast.company)
  end
  @companys.uniq!
  erb :results
end

post '/cast' do
  @title = 'Yeah!'

  # eyeshadow
  @name = params['name']
  @company = params['company']
  @color = params['color']
  p params
  # photo
  if !params['pic_url']
    @photo = Photo.new
    # @photo.image = File.new(params['pic_url'])
    @photo.image = File.new('photos/photo.png')
    @photo.image.save!
    @photo.image_uid
    # @photo_url = @photo.image.thumb("200x200").url
    @photo_url = @photo.image.url
  else
    @photo_url = params['pic_url']
  end

  @store = YAML::Store.new 'eyeshadows.yml'
  @store.transaction do
    @store['casts'] ||= []
    @store['casts'] << Eyeshadow.new(@name, @company, @color, @photo_url)
  end
  erb :cast
end

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

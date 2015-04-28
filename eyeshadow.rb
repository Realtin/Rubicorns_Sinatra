require 'yaml/store'

class Eyeshadow
  def self.raw_eyeshadows
    raw_eyeshadow = database.transaction do |save|
      save['eyeshadows'] || []
    end
  end

  def self.all
    raw_eyeshadow.map do |data|
       new(data[:name], data[:color])
    end
  end

  def initialize(name, color)
    @name = name
    @color = color
  end

  def save
    save['eyeshadows'] << {name: name, color: color}
  end

  def self.database
    @database ||= YAML::Store.new("eyeshadows")
  end

  def database
    Eyeshadow.database
  end
end

class Eyeshadow
  # Color = Struct.new(:base, :snd, :lightness, :finish)

  attr_reader :name, :company, :color

  def initialize(name, company, color)
    @name = name
    @company = company
    @color = color
  end
end

# {name: Knickers in a Twist, company: Fyrinnae, color: [taupe, bronze], cw: orange, neutral: true, lightness: 5, tone: neutral }

class Eyeshadow
  # Color = Struct.new(:base, :snd, :lightness, :finish)

  attr_reader :name, :company, :color, :image_uid

  def initialize(name, company, color, image_uid)
    @name = name
    @company = company
    @color = color
    @image_uid = image_uid
  end



end

# {name: Knickers in a Twist, company: Fyrinnae, color: [taupe, bronze], cw: orange, neutral: true, lightness: 5, tone: neutral }

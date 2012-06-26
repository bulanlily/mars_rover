class Position
  attr_accessor :x, :y
  def initialize x,y
    @x,@y = x,y
  end

  def == other_position
    @x == other_position.x and @y == other_position.y
  end
end
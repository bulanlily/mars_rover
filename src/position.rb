class Position
  attr_accessor :x, :y

  def initialize x, y
    @x, @y = x, y
  end

  def == other_position
    @x == other_position.x and
        @y == other_position.y
  end

  def next_west_position
    Position.new @x -1, y
  end

  def next_north_position
    Position.new @x, y+1
  end

  def next_east_position
    Position.new @x +1, y
  end

  def next_south_position
    Position.new @x, y-1
  end


end
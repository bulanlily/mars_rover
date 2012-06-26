class Rover
  DIRECTIONS = %w{W N E S}
  attr_accessor :position, :direction, :plateau

  def initialize (position, direction)
    raise"Invalid Direction Input!" unless DIRECTIONS.include? direction
    @position, @direction=position, direction
  end

  def turn action
    @direction=case action
                 when 'L'
                   DIRECTIONS.fetch(DIRECTIONS.index(direction)-1, DIRECTIONS[0])
                 when 'R'
                   DIRECTIONS.fetch(DIRECTIONS.index(direction)+1, DIRECTIONS[0])
                 else
                   raise "Invalid Action Command!"
               end
  end
end
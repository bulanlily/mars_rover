class Rover
  DIRECTIONS = %w{west north east south}
  attr_accessor :position, :direction, :plateau

  def initialize (position, direction, plateau)
    @position, @direction, @plateau=position, direction, plateau
    @plateau.refresh_valid_positions @position
  end

  def turn action
    @direction=
        case action
          when 'L'
            DIRECTIONS.fetch(DIRECTIONS.index(direction)-1, DIRECTIONS[0])
          when 'R'
            DIRECTIONS.fetch(DIRECTIONS.index(direction)+1, DIRECTIONS[0])
          else
            raise "Invalid Action Command!"
        end
  end


  def move
    method_name = "next_#{@direction}_position"
    new_position = @position.send(method_name)
    if plateau.valid? new_position
      plateau.refresh_valid_positions(new_position, @position)
      @position = new_position
    end
  end
end
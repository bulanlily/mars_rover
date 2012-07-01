require_relative '../src/position'
class Plateau
  attr_accessor :valid_positions

  def initialize(right, upper)
    @valid_positions=[]
    upper.downto(0) do |y|
      right.downto(0) do |x|
        position = Position.new(x, y)
        @valid_positions << position
      end
    end
  end

  def valid? position
    @valid_positions.include? position
  end

  def refresh_valid_positions (new_position, old_position = nil)
    @valid_positions.delete(new_position)
    @valid_positions << old_position
  end

end

require_relative '../src/plateau'
require_relative '../src/rover'
require_relative '../src/position'
class ConsoleController
  def build_plateau (command_string)
    commands = command_string.split(' ')
    Plateau.new(commands[0].to_i, commands[1].to_i)
  end

  def build_rover (command_string, plateau)
    commands = command_string.split(' ')
    position = Position.new(commands[0].to_i, commands[1].to_i)
    Rover.new(position, commands[2], plateau)
  end

  def move_rover (rover, command_string)
    command_string.each_char do |command|
      case command
        when 'M'
          rover.move
        else
          rover.turn command
      end
    end
  end


end
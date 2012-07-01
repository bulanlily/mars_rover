require_relative '../src/plateau'
require_relative '../src/rover'
require_relative '../src/position'
class ConsoleController
  DIRECTION_MAP = {'W' => 'west', 'N' => 'north', 'E' => 'east', 'S' => 'south'}

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

  if __FILE__ == $0
    controller = ConsoleController.new
    puts '================='
    plateau = controller.build_plateau(gets)
    rovers = []
    while 1
      build_rover_command = gets.strip.gsub(/[ENSW]/) { |direction| DIRECTION_MAP[direction] }
      break if build_rover_command.empty?
      rover = controller.build_rover(build_rover_command, plateau)
      rovers<<rover
      move_rover_command = gets.strip
      controller.move_rover(rover, move_rover_command)
    end
    rovers.each do |rover|
      puts "#{rover.position.x} #{rover.position.y} #{DIRECTION_MAP.key(rover.direction)}"
    end
  end
end
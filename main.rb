require_relative 'src/plateau'
require_relative 'src/rover'
require_relative 'src/position'
require_relative 'controllers/console_controller'
class Main
  DIRECTION_MAP = {'W' => 'west', 'N' => 'north', 'E' => 'east', 'S' => 'south'}

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
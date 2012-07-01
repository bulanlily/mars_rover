require "rspec"
require_relative "../controllers/console_controller"

describe ConsoleController do
  before { @console_controller = ConsoleController.new }
  describe :build_plateau do
    it "should build a plateau" do
      Plateau.should_receive(:new).with(5, 5)
      @console_controller.build_plateau('5 5')
    end
  end
  describe :build_rover do
    it "should build a rover" do
      plateau = double()
      Rover.should_receive(:new)
      @console_controller.build_rover('0 0 north', plateau)
    end
  end

  describe :mover_rover do
    it "should move a rover" do
      plateau = @console_controller.build_plateau('5 5')
      rover = @console_controller.build_rover('1 2 north', plateau)
      @console_controller.move_rover(rover,'LMLMLMLMM')
      rover.position.should == Position.new(1,3)
      rover.direction.should == 'north'
    end
    it "should move a rover" do
      plateau = @console_controller.build_plateau('5 5')
      rover = @console_controller.build_rover('3 3 east', plateau)
      @console_controller.move_rover(rover,'MMRMMRMRRM')
      rover.position.should == Position.new(5,1)
      rover.direction.should == 'east'
    end
  end
end
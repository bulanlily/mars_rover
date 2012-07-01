require "rspec"
require_relative '../../src/rover'

describe Rover do
  let(:position1) { double(:x => 1, :y => 1) }
  let(:position2) { double(:x => 1, :y => 2) }
  let(:position3) { double(:x => 1, :y => 0) }
  let(:plateau) { double() }
  before do
    plateau.should_receive(:refresh_valid_positions)
    @rover=Rover.new(position1, 'north', plateau)
  end
  describe :turn do
    it "should turn left when get a left command" do
      @rover.turn('L')
      @rover.direction.should == 'west'
    end
    it "should turn right when get a right command" do
      @rover.turn('R')
      @rover.direction.should == 'east'
    end
    it "should raise an exception when get a invalid command" do
      expect { @rover.turn('A') }.should raise_exception
    end
  end

  describe :move do
    it "should move if next position is valid" do
      position1.stub(:next_north_position).and_return(position2)
      plateau.stub(:valid?,position2).and_return(true)
      plateau.should_receive(:refresh_valid_positions)
      @rover.move
      @rover.position.should == position2
    end
    it "should not move if next position is invalid" do
      position1.stub(:next_south_position).and_return(position3)
      plateau.stub(:valid?,position3).and_return(false)
      @rover.direction='south'
      @rover.move
      @rover.position.should == position1
    end
  end
end
require "rspec"
require_relative '../../src/rover'

describe Rover do
  describe :initialize do
    let(:position) { double("position") }
    describe "when get a valid direction" do
      it "should get the right direction" do
        Rover.new(position, 'N').direction.should == 'N'
      end
    end
    describe "when get a invalid direction" do
      it "should raise an exception" do
        expect { Rover.new(position, 'A') }.should raise_exception
      end
    end
  end

  describe :turn do
    let(:rover) { Rover.new(double("position"), 'N') }
    describe "when get a left command" do
      it "should turn left" do
        rover.turn('L')
        rover.direction.should == 'W'
      end
    end
    describe "when get a right command" do
      it "should turn left" do
        rover.turn('R')
        rover.direction.should == 'E'
      end
    end
    describe "when get a invalid command" do
      it "should raise an exception" do
        expect { rover.turn('A') }.should raise_exception
      end
    end
  end
end
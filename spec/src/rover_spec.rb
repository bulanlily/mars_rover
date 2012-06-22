require "rspec"
require_relative '../../src/rover'

describe Rover do
  describe :turn do
    let(:rover){Rover.new(0,0,'N')}
    describe "when get a left command" do
      it "should turn left" do
         rover.turn('L')
         rover.direction.should == 'W'
      end
    end
  end
end
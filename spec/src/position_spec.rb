require "rspec"
require_relative '../../src/position'
class PositionSpec
  describe Position do
    describe :initialize do
      it "should get the right position" do
        x =Position.new(2, 2).x
        x.should == 2
      end
    end

    describe :== do
      it "should be equal when x and y equals" do
        Position.new(2,2).should == Position.new(2,2)
      end
      it "should not be equal when x or y does not equal" do
        Position.new(2,2).should_not == Position.new(2,3)
      end
    end
  end
end
require "rspec"
require_relative '../../src/position'
class PositionSpec
  describe Position do
    let(:position) { Position.new(2, 2) }
    describe :initialize do
      it "should get the right position" do
        x =position.x
        x.should == 2
      end
    end

    describe :== do
      it "should be equal when x and y equals" do
        position.should == Position.new(2, 2)
      end
      it "should not be equal when x or y does not equal" do
        position.should_not == Position.new(2, 3)
      end
    end

    describe "next position" do
      it "should get the next west position" do
        position.next_west_position.x.should == 1
      end
      it "should get the next north position" do
        position.next_north_position.y.should == 3
      end
      it "should get the next east position" do
        position.next_east_position.x.should == 3
      end
      it "should get the next south position" do
        position.next_south_position.y.should == 1
      end
    end
  end
end
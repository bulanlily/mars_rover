require "rspec"
require_relative '../../src/plateau'

class PlateauSpec
  describe Plateau do
    let(:plateau) { Plateau.new(2, 2) }
    let(:position1) { double(:x => 1, :y => 1) }
    let(:position2) { double(:x => 2, :y => 1) }
    let(:position3) { double(:x => 3, :y => 1) }

    describe :valid? do
      it "should return true when the position is valid" do
        plateau.valid?(position1).should be_true
      end
      it "should return false when the position is invalid" do
        plateau.valid?(position3).should_not be_true
      end
    end
    describe :refresh_valid_positions do
      it "should move the old position and add the new position when refreshing the valid positions" do
        plateau.refresh_valid_positions(position1, position2)
        plateau.valid?(position1).should be_false
        plateau.valid?(position2).should be_true
      end
    end


  end
end
require_relative 'spec_helper'
require_relative 'player'

describe Player do

	before do
		@player = Player.new("larry")
		$stdout = StringIO.new
	end

	it "has a capitalized name" do
		@player.name.should == "Larry"
	end

	it "has an initial health" do
		@player.health.should == 100
	end

	it "has a string representation" do
		@player.to_s.should == "I'm Larry with a health of 100 and a score of 105."
	end

	it "computes a score as the sum of its health and length of name" do
		@player.score.should == 105
	end

	it "increases health by 15 when w00ted" do
		@player.w00t

		@player.health.should == 115
	end

	it "decreases health by 10 when blammed" do
		@player.blam

		@player.health.should == 90
	end

end
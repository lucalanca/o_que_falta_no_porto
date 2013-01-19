require 'spec_helper'

describe Idea do
	let!(:idea) { FactoryGirl.create(:idea) }

	it { should validate_presence_of(:description) }
	it { should validate_uniqueness_of(:description) }

	it "should have valid factory" do
		idea.should be_valid
	end

	it "is valid with a description" do
		idea.should be_valid
	end

	it "starts with 0 votes" do
		idea.votes_for.should be 0
		idea.votes_against.should be 0
		idea.plusminus.should be 0
	end

	it "is thumbs uppable" do
		idea.thumbs_up.should be_valid
		idea.votes_for.should be 1
		idea.votes_against.should be 0
		idea.plusminus.should be 1
	end

	it "is thumbs uppable by the same user" do
		#  first vote
		idea.thumbs_up.should be_valid
		idea.votes_for.should be 1
		idea.votes_against.should be 0
		idea.plusminus.should be 1

		# second vote
		idea.thumbs_up.should be_valid
		idea.votes_for.should be 2
		idea.votes_against.should be 0
		idea.plusminus.should be 2
	end

	it "is thumbs downable" do
		idea.thumbs_down.should be_valid
		idea.votes_against.should be 1
		idea.votes_for.should be 0
		idea.plusminus.should be -1
	end

	it "is thumbs downable by the same user" do
		#  first vote
		idea.thumbs_down
		idea.votes_against.should be 1
		idea.votes_for.should be 0
		idea.plusminus.should be -1

		# second vote
		idea.thumbs_down
		idea.votes_against.should be 2
		idea.votes_for.should be 0
		idea.plusminus.should be -2
	end

	it "calculates plusminus votes automatically once is voted (for or against)" do
		idea.thumbs_down
		idea.plusminus.should be -1
		3.times do
			idea.thumbs_up
		end
		idea.plusminus.should be 2
		5.times do
			idea.thumbs_down
		end
		idea.plusminus.should be -3
	end


end

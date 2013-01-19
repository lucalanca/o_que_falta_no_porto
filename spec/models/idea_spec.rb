require 'spec_helper'

describe Idea do
	let!(:idea) { Factory.create(:idea) }
	let!(:empty_idea) { Factory.create(:empty_idea) }

	it "should have valid factory" do
		idea.should be_valid
		empty.should_not be_valid
	end

	it "is valid witho a description" do
		idea.should be_valid
	end
end

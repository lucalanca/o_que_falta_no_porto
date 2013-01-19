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
end

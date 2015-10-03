require 'spec_helper'

describe "DashboardHelper" do
	describe "#calendar_alignment" do
		it "should return one div if the 1st begins on a Monday" do
			Date.stub(:today) { Date.new(2015,6,1) }
			helper.calendar_alignment.should match("<div class=\"date-blank\"></div>")
		end
		it "should return two divs if the 1st begins on a Tuesday" do
			Date.stub(:today) { Date.new(2015,9,1) }
			helper.calendar_alignment.should match("<div class=\"date-blank\"></div><div class=\"date-blank\"></div>")
		end
		it "should return three divs if the 1st begins on a Wednesday" do
			Date.stub(:today) { Date.new(2015,7,1) }
			helper.calendar_alignment.should match("<div class=\"date-blank\"></div><div class=\"date-blank\"></div><div class=\"date-blank\"></div>")
		end
		it "should return four divs if the 1st begins on a Thursday" do
			Date.stub(:today) { Date.new(2015,10,1) }
			helper.calendar_alignment.should match("<div class=\"date-blank\"></div><div class=\"date-blank\"></div><div class=\"date-blank\"></div><div class=\"date-blank\"></div>")
		end
		it "should return five divs if the 1st begins on a Friday" do
			Date.stub(:today) { Date.new(2015,5,1) }
			helper.calendar_alignment.should match("<div class=\"date-blank\"></div><div class=\"date-blank\"></div><div class=\"date-blank\"></div><div class=\"date-blank\"></div><div class=\"date-blank\"></div>")
		end
		it "should return six divs if the 1st begins on a Saturday" do
			Date.stub(:today) { Date.new(2015,8,1) }
			helper.calendar_alignment.should match("<div class=\"date-blank\"></div><div class=\"date-blank\"></div><div class=\"date-blank\"></div><div class=\"date-blank\"></div><div class=\"date-blank\"></div><div class=\"date-blank\"></div>")
		end
		it "should return no divs if the 1st begins on a Sunday" do
			Date.stub(:today) { Date.new(2015,3,1) }
			helper.calendar_alignment.should eq nil
		end
	end
end
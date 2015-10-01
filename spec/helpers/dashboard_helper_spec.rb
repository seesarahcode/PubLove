require 'spec_helper'

describe "DashboardHelper" do
	describe "#calendar_alignment" do
		it "should return one div if the 1st begins on a Monday" do
			Time.stub(:now) { Time.new(2015,6,1, 12,00,0, "+09:00").utc }
			helper.calendar_alignment.should have_selector("div.month-days") do |content|
    		content.should have_selector(:div, :class => "date-blank")
    	end
		end
		it "should return two divs if the 1st begins on a Tuesday" do
			pending
		end
		it "should return three divs if the 1st begins on a Wednesday" do
			pending
		end
		it "should return four divs if the 1st begins on a Thursday" do
			pending
		end
		it "should return five divs if the 1st begins on a Friday" do
			pending
		end
		it "should return six divs if the 1st begins on a Saturday" do
			pending
		end
		it "should return no divs if the 1st begins on a Sunday" do
			pending
		end
	end
end
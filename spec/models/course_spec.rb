require 'spec_helper'
require 'course'

describe Course do 
    it "is called Ross' Amazing Course" do
    	course = Course.new
    	course.title.should == "Ross' Amazing Course"
    end
end
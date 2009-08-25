require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

class Thing < ActiveRecord::Base
end

describe "SetsUuid" do
  it "should be able to create new things" do
    lambda { Thing.create! }.should_not raise_error
  end
end

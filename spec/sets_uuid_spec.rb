require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

class Thing < ActiveRecord::Base
  sets_uuid :before_validation, :a => :compact
  sets_uuid :before_create, :b => :default
end

describe "SetsUuid" do
  it "should be able to create new things" do
    lambda { Thing.create! :a => "1", :b => "2", :c => "3" }.should_not raise_error
  end

  it "should be able to set the UUID before validation" do
    a = Thing.new
    a.a.should be_blank
    a.b.should be_blank
    a.c.should be_blank

    a.valid?

    a.a.should_not be_blank
    a.b.should be_blank
    a.c.should be_blank
  end

  it "should be able to set the UUID before creation" do
    a = Thing.new
    a.a.should be_blank
    a.b.should be_blank
    a.c.should be_blank

    a.save!

    a.a.should_not be_blank
    a.b.should_not be_blank
    a.c.should be_blank
  end
end

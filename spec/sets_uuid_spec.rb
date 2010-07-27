require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

class Thing < ActiveRecord::Base
  sets_uuid :before_validation, :compact => :compact
  sets_uuid :before_create, :default => :default
end

describe "SetsUuid" do
  it "does not interfere with things creation" do
    expect { Thing.create!(:some_field => "42") }.to_not raise_error
  end

  it "can create compact and default uuids" do
    thing = Thing.create
    thing.compact.should_not =~ /-/
    thing.default.should =~ /-/
  end

  it "sets the UUID before validation" do
    thing = Thing.new

    thing.compact.should be_blank
    thing.default.should be_blank
    thing.some_field.should be_blank

    thing.valid?

    thing.compact.should_not be_blank
    thing.default.should be_blank
    thing.some_field.should be_blank
  end

  it "sets the UUID before creation" do
    thing = Thing.new

    thing.compact.should be_blank
    thing.default.should be_blank
    thing.some_field.should be_blank

    thing.save!

    thing.compact.should_not be_blank
    thing.default.should_not be_blank
    thing.some_field.should be_blank
  end
end

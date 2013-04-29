require 'spec_helper'

describe Usuario do
  before(:each) do
    @attr = { :username => "Example User", :email => "user@example.com" }
  end

  it "should create a new instance given valid attributes" do
    Usuario.create!(@attr)
  end

  it "should require a name" do
    no_name_user = Usuario.new(@attr.merge(:username => ""))
    no_name_user.should_not be_valid
  end
  
  it "should reject names that are too long" do
    long_name = "a" * 51
    long_name_user = Usuario.new(@attr.merge(:username => long_name))
    long_name_user.should_not be_valid
  end

end

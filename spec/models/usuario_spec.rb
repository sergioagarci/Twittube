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

  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = Usuario.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = Usuario.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end

  it "should reject duplicate email addresses" do
    # Put a user with given email address into the database.
    Usuario.create!(@attr)
    user_with_duplicate_email = Usuario.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

end

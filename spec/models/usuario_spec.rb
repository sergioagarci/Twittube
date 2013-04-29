require 'spec_helper'

describe Usuario do
  before(:each) do
    @attr = { :username => "Example User",
              :email => "user@example.com",
              :password => "example01",
              :password_confirmation => "example01" }
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

  it "should reject email addresses identical up to case" do
    upcased_email = @attr[:email].upcase
    Usuario.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = Usuario.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  describe "password validations" do

    it "should require a password" do
      Usuario.new(@attr.merge(:password => "", :password_confirmation => "")).
        should_not be_valid
    end

    it "should require a matching password confirmation" do
      Usuario.new(@attr.merge(:password_confirmation => "invalid")).
        should_not be_valid
    end

    it "should reject short passwords" do
      short = "a" * 5
      hash = @attr.merge(:password => short, :password_confirmation => short)
      Usuario.new(hash).should_not be_valid
    end

    it "should reject long passwords" do
      long = "a" * 41
      hash = @attr.merge(:password => long, :password_confirmation => long)
      Usuario.new(hash).should_not be_valid
    end
  end
  describe "password encryption" do

    before(:each) do
      @user = Usuario.create!(@attr)
    end

    it "should have an encrypted password attribute" do
      @user.should respond_to(:crypted_password)
    end
  end
end

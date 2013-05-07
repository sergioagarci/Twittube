require 'spec_helper'

describe Usuario do
  before(:each) do
    @user = { :username  => "Example User",
              :email     => "user@example.com",
              :password  => "example01",
              :password_confirmation => "example01", 
              :password_digest => "example01" }
  end

  subject { @user }
  
  it { should respond_to(:username) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:microposts) }

  it { should be_valid }

  it "should create a new instance given valid attributes" do
    Usuario.create!(@user)
  end

  it "should require a name" do
    no_name_user = Usuario.new(@user.merge(:username => ""))
    no_name_user.should_not be_valid
  end
  
  it "should reject names that are too long" do
    long_name = "a" * 51
    long_name_user = Usuario.new(@user.merge(:username => long_name))
    long_name_user.should_not be_valid
  end

  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = Usuario.new(@user.merge(:email => address))
      valid_email_user.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = Usuario.new(@user.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end

  it "should reject duplicate email addresses" do
    # Put a user with given email address into the database.
    Usuario.create!(@user)
    user_with_duplicate_email = Usuario.new(@user)
    user_with_duplicate_email.should_not be_valid
  end

  it "should reject email addresses identical up to case" do
    upcased_email = @user[:email].upcase
    Usuario.create!(@user.merge(:email => upcased_email))
    user_with_duplicate_email = Usuario.new(@user)
    user_with_duplicate_email.should_not be_valid
  end

  

  describe "when password is not present" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end

  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }

    describe "with valid password" do
      it { should == found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end
  end
end
=begin
  describe "password encryption" do

    before(:each) do
      @user = Usuario.create!(@user)
     Usuario.stub!(:find, @user.id).and_return(@user)
    end

    it "should have an encrypted password attribute" do
      @user.should respond_to(:crypted_password)
    end

    it "should set the encrypted password" do
      @user.encrypt_password.should_not be_blank
    end

    describe "has_password? method" do

      it "should be true if the passwords match" do
        @user.has_password?(@user[:password]).should be_true
      end    

      it "should be false if the passwords don't match" do
        @user.has_password?("invalid").should be_false
      end 
    end

    describe "authenticate method" do

      it "should return nil on email/password mismatch" do
        wrong_password_user = Usuario.authenticate(@user[:email], "wrongpass")
        wrong_password_user.should be_nil
      end

      it "should return nil for an email address with no user" do
        nonexistent_user = Usuario.authenticate("bar@foo.com", @user[:password])
        nonexistent_user.should be_nil
      end

      it "should return the user on email/password match" do
        matching_user = Usuario.authenticate(@user[:email], @user[:password])
        matching_user.should == @user
      end
    end

  end

end
=end

describe "micropost associations" do

    before { @user.save }
    let!(:older_micropost) do 
      FactoryGirl.create(:micropost, usuario: @user, created_at: 1.day.ago)
    end
    let!(:newer_micropost) do
      FactoryGirl.create(:micropost, usuario: @user, created_at: 1.hour.ago)
    end

    it "should have the right microposts in the right order" do
      @user.microposts.should == [newer_micropost, older_micropost]
    end
    it "should destroy associated microposts" do
      microposts = @user.microposts.dup
      @user.destroy
      microposts.should_not be_empty
      microposts.each do |micropost|
        Micropost.find_by_id(micropost.id).should be_nil
      end
    end
  end

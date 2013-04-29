require 'spec_helper'

describe "Usuarios" do
  describe "GET /usuarios" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get usuarios_path
      response.status.should be(200)
    end
  end

 describe "password encryption" do

    before(:each) do
      @user = User.create!(@attr)
    end
   
    describe "has_password? method" do

      it "should be true if the passwords match" do
        @user.has_password?(@attr[:password]).should be_true
      end    

      it "should be false if the passwords don't match" do
        @user.has_password?("invalid").should be_false
      end 
    end
  end
end

require 'spec_helper'

describe Micropost do

  before do
    @user = Usuario.new(username: "Example User",
    				 email: "user@example.com", 
    				 password: "foobar",
    				 password_confirmation: "foobar")
  end

  #let(:user) { FactoryGirl.create(:user) }
  before { @micropost = @user.microposts.build(content: "Lorem ipsum") }

  subject { @micropost }

  it { should respond_to(:content) }
  it { should respond_to(:usuario_id) }
  it { should respond_to(:usuario) }
  its(:usuario) { should == @user }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to usuario_id" do
      expect do
        Micropost.new(usuario_id: usuario.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

 describe "when usuario_id is not present" do
    before { @micropost.usuario_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @micropost.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @micropost.content = "a" * 141 }
    it { should_not be_valid }
  end
end
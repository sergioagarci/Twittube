require 'spec_helper'

describe "usuarios/edit" do
  before(:each) do
    @usuario = assign(:usuario, stub_model(Usuario,
      :username => "MyString",
      :email => "MyString",
      :crypted_password => "MyString",
      :salt => "MyString"
    ))
  end

  it "renders the edit usuario form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => usuarios_path(@usuario), :method => "post" do
      assert_select "input#usuario_username", :name => "usuario[username]"
      assert_select "input#usuario_email", :name => "usuario[email]"
      assert_select "input#usuario_crypted_password", :name => "usuario[crypted_password]"
      assert_select "input#usuario_salt", :name => "usuario[salt]"
    end
  end
end

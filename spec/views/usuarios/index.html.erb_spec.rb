require 'spec_helper'

describe "usuarios/index" do
  before(:each) do
    assign(:usuarios, [
      stub_model(Usuario,
        :username => "Username",
        :email => "Email",
        :crypted_password => "Crypted Password",
        :salt => "Salt"
      ),
      stub_model(Usuario,
        :username => "Username",
        :email => "Email",
        :crypted_password => "Crypted Password",
        :salt => "Salt"
      )
    ])
  end

  it "renders a list of usuarios" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Crypted Password".to_s, :count => 2
    assert_select "tr>td", :text => "Salt".to_s, :count => 2
  end
end

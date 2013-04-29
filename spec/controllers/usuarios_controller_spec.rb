require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe UsuariosController do

  # This should return the minimal set of attributes required to create a valid
  # Usuario. As you add validations to Usuario, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {:username => "MyString",
     :email => "MyString@example.com",
     :password => "example12",
     :password_confirmation => "example12"}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsuariosController. Be sure to keep this updated too.
  def valid_session
    {:username => "MyString", :email => "MyString@example.com"}
  end

  describe "GET index" do
    it "assigns all usuarios as @usuarios" do
      usuario = Usuario.create! valid_attributes
      get :index, {}, valid_session
      assigns(:usuarios).should eq([usuario])
    end
  end

  describe "GET show" do

    it "assigns the requested usuario as @usuario" do
      usuario = Usuario.create! valid_attributes
      get :show, {:id => usuario.to_param}, valid_session
      assigns(:usuario).should eq(usuario)
    end
  end

  describe "GET new" do
    it "assigns a new usuario as @usuario" do
      get :new, {}, valid_session
      assigns(:usuario).should be_a_new(Usuario)
    end
  end

  describe "GET edit" do
    it "assigns the requested usuario as @usuario" do
      usuario = Usuario.create! valid_attributes
      get :edit, {:id => usuario.to_param}, valid_session
      assigns(:usuario).should eq(usuario)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Usuario" do
        expect {
          post :create, {:usuario => valid_attributes}, valid_session
        }.to change(Usuario, :count).by(1)
      end

      it "assigns a newly created usuario as @usuario" do
        post :create, {:usuario => valid_attributes}, valid_session
        assigns(:usuario).should be_a(Usuario)
        assigns(:usuario).should be_persisted
      end

      it "redirects to the created usuario" do
        post :create, {:usuario => valid_attributes}, valid_session
        response.should redirect_to(Usuario.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved usuario as @usuario" do
        # Trigger the behavior that occurs when invalid params are submitted
        Usuario.any_instance.stub(:save).and_return(false)
        post :create, {:usuario => {}}, valid_session
        assigns(:usuario).should be_a_new(Usuario)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Usuario.any_instance.stub(:save).and_return(false)
        post :create, {:usuario => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested usuario" do
        usuario = Usuario.create! valid_attributes
        # Assuming there are no other usuarios in the database, this
        # specifies that the Usuario created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Usuario.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => usuario.to_param, :usuario => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested usuario as @usuario" do
        usuario = Usuario.create! valid_attributes
        put :update, {:id => usuario.to_param, :usuario => valid_attributes}, valid_session
        assigns(:usuario).should eq(usuario)
      end

      it "redirects to the usuario" do
        usuario = Usuario.create! valid_attributes
        put :update, {:id => usuario.to_param, :usuario => valid_attributes}, valid_session
        response.should redirect_to(usuario)
      end
    end

    describe "with invalid params" do
      it "assigns the usuario as @usuario" do
        usuario = Usuario.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Usuario.any_instance.stub(:save).and_return(false)
        put :update, {:id => usuario.to_param, :usuario => {}}, valid_session
        assigns(:usuario).should eq(usuario)
      end

      it "re-renders the 'edit' template" do
        usuario = Usuario.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Usuario.any_instance.stub(:save).and_return(false)
        put :update, {:id => usuario.to_param, :usuario => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested usuario" do
      usuario = Usuario.create! valid_attributes
      expect {
        delete :destroy, {:id => usuario.to_param}, valid_session
      }.to change(Usuario, :count).by(-1)
    end

    it "redirects to the usuarios list" do
      usuario = Usuario.create! valid_attributes
      delete :destroy, {:id => usuario.to_param}, valid_session
      response.should redirect_to(usuarios_url)
    end
  end

end

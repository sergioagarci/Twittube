class UsuariosSessionsController < ApplicationController
	def new
  	@usuario = Usuario.new
  end
  def create
  	if @usuario = login(params[:username], params[:password])
  		redirect_back_or_to(posts_path, message: "Login correcto") # Metodo que te redirige a una pagina.
  	else
  		flash.now[:alert] = "A ocurrido un error al loggearse." 
  		render action: :new
  	end
  end
  def destroy
  	logout
  	redirect_to(:usuarios, message: "Logged out")
  end
end

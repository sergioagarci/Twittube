class StaticPagesController < ApplicationController
	def home
		@autor = ' Noel Diaz Mesa '
	end
	def form
		@name = params[:nombre_usuario]
		@nombre = Form.all
		@ejemplo = Form.create({name: @name})
	end
end

class RolesController < ApplicationController
  before_filter :signed_in_with_role_admin
	
	def new
		@role = Role.new
	end

	def create
		@role = Role.new(role_params)
		if @role.save
			flash[:success] = "Role #{@role.name} created."
			redirect_to roles_path
		else
			flash[:error] = "The name of your role is too short."
			render 'new'
		end
	end

	def index
		@roles = Role.all
	end

	def destroy
		Role.find_by(id: params[:id]).destroy
		flash[:success] = "Role deleted"
		redirect_to roles_path
	end

	private
		def role_params
			params.require(:role).permit(:name)
		end

  	def signed_in_with_role_admin
  		authenticate_user!
  		redirect_to new_user_session_path, notice: "You are not an admin user" \
  			unless current_user.has_role?("Admin")
  	end

end

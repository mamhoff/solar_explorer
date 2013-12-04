class Users::RegistrationsController < Devise::RegistrationsController
	def create
		@user = User.new(params[:user])
		if @user.save
			flash(:success) = "Success"
		else
			redirect_to root_path
		end
	end
end


class ToursController < ApplicationController
  before_filter :signed_in_with_role_admin, only: [:create, :new]
	
	def new
		@tour = Tour.new
	end

	def index
		@tours = Tour.all
	end

	def destroy
		Tour.find_by(id: params[:id]).destroy
		flash[:success] = "Role deleted"
		redirect_to tours_path
	end

	def create
		@tour = Tour.new(tour_params)
		if @tour.save
			flash[:success] = "Tour #{@tour.name} created."
			redirect_to tours_path
		else
			flash[:error] = "The name of your tour is too short."
			render 'new'
		end
	end

	private

	  	def signed_in_with_role_admin
	  		authenticate_user!
	  		redirect_to new_user_session_path, notice: "You are not an admin user" \
	  			unless current_user.has_role?("Admin")
	  	end
		def tour_params
			params.require(:tour).permit(:name)
		end


end

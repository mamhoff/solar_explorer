class StaticPagesController < ApplicationController
  before_filter :signed_in_with_role_admin, only: [:admin_instructions]

  def home
  end

  def imprint
  end

  def boat
  end

  def admin_instructions
  end

  private
  	def signed_in_with_role_admin
  		authenticate_user!
  		redirect_to root_path, notice: "You are not an admin user" \
  			unless current_user.has_role?("admin")
  	end

end

class WishesController < ApplicationController
	def new
		@wish = Wish.new
		@tour = wish_params["tour"]
	end

	private
		def wish_params
			params.permit(:tour)
		end
end

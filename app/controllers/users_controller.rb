class UsersController < ApplicationController

	def new
	end

	def create
		@user = User.new(user_params)
		@user.save
		flash[:success] = "Account created!"
		redirect_to root_url
	end

	def show
		@user = User.find_by(:id => params[:id])
	end

	private

		def user_params
			params.require(:user).permit(:name, :email)
		end
end

class SessionsController < ApplicationController
	include SessionsHelper
	def new

	end

	def create
		@user = User.find_by(email: params[:session][:email].downcase)
		if @user 
			flash[:notice] = 'Login Successful'
			log_in @user 
			redirect_to root_url
		else
			flash[:warning] = 'User not found'
			render 'new'
		end
	end

	def destroy
		log_out if logged_in?
		redirect_to root_url
	end
end

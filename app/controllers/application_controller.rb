class ApplicationController < ActionController::Base
	include SessionsHelper

	def logged_in_user
  		unless logged_in?
  			flash[:danger] = "Please log in."
  			redirect_to login_url
  		end
  	end

  	def month_name_to_num(month)
  		case month
  		when "January"
  			1
  		when "February"
  			2
  		when "March"
  			3
  		when "April"
  			4
  		when "May"
  			5
  		when "June"
  			6
  		when "July"
  			7
  		when "August"
  			8
  		when "September"
  			9
  		when "October"
  			10
  		when "November"
  			11
  		when "December"
  			12
  		else
  			0
  		end
  	end
end

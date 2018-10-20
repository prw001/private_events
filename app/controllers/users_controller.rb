class UsersController < ApplicationController

	include ApplicationHelper

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
		@past_events = past_events
		@upcoming_events = upcoming_events
	end

	private

		def user_params
			params.require(:user).permit(:name, :email)
		end

		def past_events
			past = []
			@user.attendances.each do |attendance| 
				date = clean_up_date(Event.find_by(id: attendance.event_id).date).split
				e_time = get_time(date)
				if ((Time.now - e_time) > 0)
					past << attendance
				end
			end
			past
		end

		def upcoming_events
			upcoming = []
			@user.attendances.each do |attendance| 
				date = clean_up_date(Event.find_by(id: attendance.event_id).date).split
				e_time = get_time(date)
				if ((Time.now - e_time) <= 0)
					upcoming << attendance
				end
			end
			upcoming
		end
end

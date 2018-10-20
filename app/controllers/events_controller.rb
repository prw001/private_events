class EventsController < ApplicationController
	before_action :logged_in_user, only: :create

	def new
	end

	def create
		@event = current_user.events.build(event_params)
		if @event.save
			flash[:success] = "Event created!"
			redirect_to root_url
		else
			render 'new'
		end
	end

	def show
		@event = Event.find_by(:id => params[:id])
		@num_attending = @event.attendances.count
	end

	def index
		@upcoming_events = get_upcoming_events
		@past_events = get_past_events
	end

	private

		def event_params
			params.require(:event).permit(:title, :date)
		end

		def get_upcoming_events
			upcoming = []
			Event.all.each do |event|
				if !event.is_past?
					upcoming << event 
				end
			end
			upcoming
		end

		def get_past_events
			past = []
			Event.all.each do |event| 
				if event.is_past?
					past << event 
				end
			end
			past
		end
end

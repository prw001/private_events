class EventInvitesController < ApplicationController
	before_action :email_exists?, only: :create

	def new
	end

	def create
		i_p = invite_params
		@event_invite = EventInvite.new(i_p)
		if @event_invite.save
			flash[:success] = "Invite sent!"
			redirect_to root_url
		else
			flash[:warning] = "Invite not sent."
			render 'new'
		end
	end

	def save
	end

	def update
		@event_invite.update_attribute(accepted: params['accepted'])
		if @event_invite.save
			respond_to do |format| 
				format.js { render 'event_invites/update_invite_selection' }
			end
		end
	end

	private

		def email_exists?
			unless User.find_by(email: params['event_invite']['recipient_id'])
				flash['warning'] = "Could not locate a user with that email"
				render 'new'
			end
		end

		def invite_params
			params.require(:event_invite).permit(:host_id, :event_id, :recipient_id)
			invite_p = { :recipient_id => User.find_by(email: params['event_invite']['recipient_id']).id,
						 :host_id => params['event_invite']['host_id'],
						 :event_id => params['event_invite']['event_id']}
		end
end

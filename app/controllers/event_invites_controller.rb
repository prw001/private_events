class EventInvitesController < ApplicationController
	before_action :email_exists?, only: :create
	before_action :already_invited?, only: :create

	def new
		@event_invite = EventInvite.new
		@event = Event.find_by(id: params['event_id'])
	end

	def create
		i_p = invite_params
		@event_invite = EventInvite.create(i_p)
		if @event_invite.save
			flash[:success] = "Invite sent!"
			redirect_to root_url
		else
			flash[:warning] = "Invite not sent."
			redirect_to event_invite_url
		end
	end

	def save
	end

	def update
		@event_invite = EventInvite.find_by(id: params['event_invite']['id'])
		if params['accepted'] == "Yes"
			@event_invite.update(accepted: true)
			if @event_invite.save
				respond_to do |format|
					format.js { render 'event_invites/update_invite_selection'}
				end
			end
		else
			respond_to do |format|
				format.js { render 'event_invites/update_invite_selection'}
			end
			@event_invite.delete
		end
	end

	private

		def email_exists?
			unless User.find_by(email: params['event_invite']['recipient_id'])
				flash['warning'] = "Could not locate a user with that email"
				redirect_to event_invite_url
			end
		end

		def already_invited?
			if (EventInvite.find_by(invite_params))
				flash[:warning] = "That person has already been invited."

				redirect_to event_invite_url
			end
		end

		def invite_params
			params.require(:event_invite).permit(:host_id, :event_id, :recipient_id)
			invite_p = { :recipient_id => User.find_by(email: params['event_invite']['recipient_id']).id,
						 :host_id => params['event_invite']['host_id'],
						 :event_id => params['event_invite']['event_id']}
		end
end

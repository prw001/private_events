class Event < ApplicationRecord
	include ApplicationHelper
	attr_reader :attendees
	belongs_to :user,
		class_name: "User",
		foreign_key: "user_id"
	has_many :attendances
	has_many :invited_users, foreign_key: "event_id", class_name: "EventInvite"
	validates :title, presence: true, length: {maximum: 100}
	validates :date, presence: true

	def is_past?
		e_time = get_time(clean_up_date(self.date).split)
		(Time.now - e_time) > 0
	end

	def attendees
		@attendees = get_attendance
	end

	private

		def get_attendance
			attendees = []
			self.invited_users.each do |invite|
				if invite.accepted
					attendees << User.find_by(id: invite.recipient_id)
				end
			end
			attendees
		end
end

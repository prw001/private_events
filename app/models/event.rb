class Event < ApplicationRecord
	include ApplicationHelper
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
end

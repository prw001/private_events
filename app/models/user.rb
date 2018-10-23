class User < ApplicationRecord
	validates :name, presence: true
	validates :email, presence: true, length: {maximum: 255},
			 		  uniqueness: {case_sensitive: false }
	has_many :events
	has_many :attendances
	has_many :invitations, foreign_key: "recipient_id", class_name: "EventInvite"

end

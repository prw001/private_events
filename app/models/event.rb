class Event < ApplicationRecord
	belongs_to :user,
		class_name: "User",
		foreign_key: "user_id"
	has_many :attendances
	validates :title, presence: true, length: {maximum: 100}
	validates :date, presence: true
end

class EventInvite < ApplicationRecord
  belongs_to :recipient, class_name: "User", foreign_key: "recipient_id"
  belongs_to :host, class_name: "User", foreign_key: "host_id"
  belongs_to :event

  validate :recipient_and_host_cannot_match
  validate :only_host_can_invite

  def self.recipient
  	User.find_by(id: recipient_id)
  end

  def self.host 
  	User.find_by(id: host_id)
  end

  def recipient_and_host_cannot_match
  	if recipient_id == host_id
  		errors.add(:mismatch, "Recipient and event host cannot be the same person")
  	end
  end

  def only_host_can_invite
  	if host_id != event.user.id 
  		errors.add(:unauthorized, "Only the host of the event is permitted to send invites")
  	end
  end
end

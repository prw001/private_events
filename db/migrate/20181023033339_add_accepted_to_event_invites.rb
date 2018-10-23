class AddAcceptedToEventInvites < ActiveRecord::Migration[5.2]
  def change
    add_column :event_invites, :accepted,
    		   :boolean, null: false, default: false
  end
end

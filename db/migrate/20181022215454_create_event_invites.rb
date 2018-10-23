class CreateEventInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :event_invites do |t|
      t.references :recipient
      t.references :host
      t.references :event, foreign_key: true
    end
  end
end

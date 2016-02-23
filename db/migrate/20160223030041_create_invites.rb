class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.references :attendees, index: true, foreign_key: true
      t.references :attended_events, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

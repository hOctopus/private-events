class RemoveAcceptFromInvites < ActiveRecord::Migration
  def change
    remove_column :invites, :accept
  end
end

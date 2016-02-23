class AddAcceptToInvites < ActiveRecord::Migration
  def change
    add_column :invites, :accept, :boolean, default: false
  end
end

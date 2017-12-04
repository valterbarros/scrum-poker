class AddTokenToInvite < ActiveRecord::Migration[5.1]
  def change
    add_column :invites, :token, :string, null: false
  end
end

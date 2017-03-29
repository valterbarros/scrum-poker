class AddUserRefToVote < ActiveRecord::Migration[5.0]
  def change
    add_reference :votes, :user, index: true
  end
end

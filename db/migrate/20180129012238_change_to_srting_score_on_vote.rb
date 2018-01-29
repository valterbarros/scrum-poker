class ChangeToSrtingScoreOnVote < ActiveRecord::Migration[5.1]
  def change
    remove_column :votes, :score
    add_column :votes, :score, :string
  end
end

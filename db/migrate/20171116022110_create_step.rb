class CreateStep < ActiveRecord::Migration[5.1]
  def change
    create_table :steps do |t|
      t.string :title
      t.references :session_vote, index: true, foreign_key: true

      t.timestamps
    end
  end
end

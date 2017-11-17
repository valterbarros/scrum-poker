class CreateStepsCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards_steps do |t|
      t.belongs_to :step, index: true, foreign_key: true
      t.belongs_to :card, index: true, foreign_key: true

      t.timestamps
    end
  end
end

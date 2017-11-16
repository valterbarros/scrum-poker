class CreateCard < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :title

      t.timestamps
    end
  end
end

class Vote < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :score

      t.timestamps
    end
  end
end

class CreateCategory < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :title

      t.timestamps
    end
  end
end

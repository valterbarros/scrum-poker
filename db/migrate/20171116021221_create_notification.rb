class CreateNotification < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.string :title
      t.string :body
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end

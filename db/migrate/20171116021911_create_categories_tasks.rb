class CreateCategoriesTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_tasks do |t|
      t.belongs_to :category, index: true, foreign_key: true
      t.belongs_to :task, index: true, foreign_key: true

      t.timestamps
    end
  end
end

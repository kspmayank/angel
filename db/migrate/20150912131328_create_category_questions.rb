class CreateCategoryQuestions < ActiveRecord::Migration
  def change
    create_table :category_questions do |t|
      t.references :question, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

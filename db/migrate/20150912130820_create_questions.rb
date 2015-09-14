class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :heading
      t.string :description
      t.references :user, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :answer
      t.references :question, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :views
      t.string :effective

      t.timestamps null: false
    end
  end
end

class CreateMarkspams < ActiveRecord::Migration
  def change
    create_table :markspams do |t|
      t.references :answer, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

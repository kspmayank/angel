class CreateTrendings < ActiveRecord::Migration
  def change
    create_table :trendings do |t|
      t.references :question, index: true, foreign_key: true
      t.integer :points

      t.timestamps null: false
    end
  end
end

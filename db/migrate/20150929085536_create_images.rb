class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :image
      t.references :answer, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

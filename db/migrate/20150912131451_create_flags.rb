class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
      t.references :user, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

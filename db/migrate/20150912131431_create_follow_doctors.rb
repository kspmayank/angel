class CreateFollowDoctors < ActiveRecord::Migration
  def change
    create_table :follow_doctors do |t|
      t.references :user, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

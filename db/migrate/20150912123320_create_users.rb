class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :pid
      t.datetime :dob
      t.references :avatar, index: true, foreign_key: true
      t.string :description
      t.string :role
      t.string :qualification
      t.integer :experience
      t.string :city
      t.string :string
      t.integer :credits
      t.string :hospital
      t.string :speciality
      t.string :photoid
      t.string :certificate

      t.timestamps null: false
    end
  end
end

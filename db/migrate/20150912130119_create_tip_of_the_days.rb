class CreateTipOfTheDays < ActiveRecord::Migration
  def change
    create_table :tip_of_the_days do |t|
      t.string :tip

      t.timestamps null: false
    end
  end
end

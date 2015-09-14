class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
      t.string :name
      t.string :link

      t.timestamps null: false
    end
  end
end

class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :prototype_id
      
      t.timestamps null: false
    end
  end
end

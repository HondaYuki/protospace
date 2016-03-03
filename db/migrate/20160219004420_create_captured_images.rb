class CreateCapturedImages < ActiveRecord::Migration
  def change
    create_table :captured_images do |t|
      t.string :name
      t.integer :status
      t.references :prototype
      t.timestamps
    end
  end
end

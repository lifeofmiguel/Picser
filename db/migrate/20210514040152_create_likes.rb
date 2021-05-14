class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.integer :account_id
      t.integer :image_id
      t.timestamps
    end
  end
end

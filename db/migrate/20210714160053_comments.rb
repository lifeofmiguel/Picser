class Comments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :user_id
      t.timestamps
      t.integer :image_id
    end
  end
end

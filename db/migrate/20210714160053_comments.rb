class Comments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :name
      t.text :body
      t.integer :account_id
      t.timestamps
      t.integer :image_id
    end
  end
end

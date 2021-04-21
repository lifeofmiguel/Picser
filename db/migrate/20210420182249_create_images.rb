class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.text :caption
      t.integer :likes, default: 0 
      t.timestamps
    end
  end
end

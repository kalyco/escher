class CreatePieces < ActiveRecord::Migration[5.0]
  def change
    create_table :pieces do |t|
    	t.text :title
    	t.text :description
    	t.text :category
    	t.text :url, null: false
    	t.integer :price

    	t.timestamps
    end
  end
end

class CreatePieces < ActiveRecord::Migration[5.0]
  def change
    create_table :pieces do |t|
    	t.text :title, null: false
    	t.text :url, null: false
        t.text :description
        t.text :category
    	t.integer :price
        t.boolean :featured

    	t.timestamps
    end
  end
end

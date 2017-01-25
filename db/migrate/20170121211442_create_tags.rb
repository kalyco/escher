class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
    	t.references :pieces, null: false
    	t.text :label, null: false

    	t.timestamps
    end
  end
end

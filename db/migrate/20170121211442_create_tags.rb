class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
    	t.text :label, null: false

    	t.timestamps
    end
    add_index :tags, :label, unique: true
  end
end

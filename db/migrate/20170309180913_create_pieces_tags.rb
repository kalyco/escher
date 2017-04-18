class CreatePiecesTags < ActiveRecord::Migration[5.0]
  def change
    create_table :pieces_tags, id: false do |t|
    	t.integer :piece_id
    	t.integer :tag_id

    	t.timestamps
    end
  end
end

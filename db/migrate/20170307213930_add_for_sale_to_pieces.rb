class AddForSaleToPieces < ActiveRecord::Migration[5.0]
  def change
  	add_column :pieces, :for_sale, :boolean
  	add_column :pieces, :available, :boolean
  end
end

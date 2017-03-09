class AddYearToPieces < ActiveRecord::Migration[5.0]
  def change
  	add_column :pieces, :year, :integer
  	add_column :pieces, :size, :string
  end
end

class AddTwoStrings < ActiveRecord::Migration
  def change
	add_column :cards, :cardnum, :string
	add_column :cards, :cardtype, :string
  end
end

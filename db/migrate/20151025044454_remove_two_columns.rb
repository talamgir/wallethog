class RemoveTwoColumns < ActiveRecord::Migration
  def change
	remove_column :cards, :cardnum
	remove_column :cards, :cardtype
  end
end

class ChangeDate < ActiveRecord::Migration
  def change
	remove_column :cards, :expyear
	add_column :cards, :expyear, :integer
  end
end

class RemoveAddCardtype < ActiveRecord::Migration
  def change
	remove_column :cards, :cardtype
  end
end

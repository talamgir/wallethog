class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :cardnum
      t.integer :cardtype
      t.integer :seccode
      t.integer :expmonth
      t.datetime :expyear

      t.timestamps null: false
    end
  end
end

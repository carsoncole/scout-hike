class AddIndexToTreksOnDate < ActiveRecord::Migration[6.0]
  def change
    add_index :treks, :date
  end
end

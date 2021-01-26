class AddIndexDistanceInMilesOnUsers < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :miles_count
  end
end

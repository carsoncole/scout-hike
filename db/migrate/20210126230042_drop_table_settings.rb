class DropTableSettings < ActiveRecord::Migration[6.0]
  def up
    drop_table :settings
  end
end

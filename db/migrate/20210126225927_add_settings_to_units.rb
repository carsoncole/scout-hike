class AddSettingsToUnits < ActiveRecord::Migration[6.0]
  def change
    add_column :units, :start_date, :date
    add_column :units, :end_date, :date
    add_column :units, :miles_goal, :integer
  end
end

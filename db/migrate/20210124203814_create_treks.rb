class CreateTreks < ActiveRecord::Migration[6.0]
  def change
    create_table :treks do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.decimal :distance_in_miles, scale: 2, precision: 5, default: 0

      t.timestamps
    end
  end
end

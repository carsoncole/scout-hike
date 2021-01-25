class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.timestamps null: false
      t.string :email, null: false
      t.integer :unit_id
      t.string :screenname, null: false
      t.decimal :miles_count, default:0, scale: 2, precision: 5
      t.string :encrypted_password, limit: 128, null: false
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128, null: false
    end

    add_index :users, :email
    add_index :users, :remember_token
  end
end

class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :applications do |t|
      t.text :key, null: false
      t.text :secret, null: false
      t.integer :customer_id, null: false

      t.timestamps
    end

    add_index :applications, :customer_id
    add_foreign_key :applications, :customers, column: :customer_id, primary_key: :id
  end
end

class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.text :name, null: false
      t.string :iban, null: false
      t.decimal :amount, precision: 8, scale: 2
      t.string :currency
      t.text :status, null: false
      t.integer :customer_id, null: false

      t.timestamps
    end

    add_index :payments, :status, length: 4
    add_index :payments, :customer_id
    add_foreign_key :payments, :customers, column: :customer_id, primary_key: :id
  end
end

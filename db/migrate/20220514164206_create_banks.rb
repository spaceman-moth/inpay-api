class CreateBanks < ActiveRecord::Migration[7.0]
  def change
    create_table :banks do |t|
      t.text :name, null: false
      t.text :api_url, null: false
      t.jsonb :credentials, null: false, default: {}

      t.timestamps
    end
  end
end

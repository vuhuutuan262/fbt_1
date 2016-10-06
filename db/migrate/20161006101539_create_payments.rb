class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.text :content
      t.integer :amount
      t.integer :sendAccount_id
      t.integer :receiveAccount_id
      t.references :booking, foreign_key: true

      t.timestamps
    end
    add_index :payments, :sendAccount_id
    add_index :payments, :receiveAccount_id
    add_index :payments, [:sendAccount_id, :receiveAccount_id], unique: true
  end
end

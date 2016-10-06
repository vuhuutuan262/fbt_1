class CreateBankAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :bank_accounts do |t|
      t.string :userName
      t.string :password
      t.string :accountNumber
      t.integer :balance
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

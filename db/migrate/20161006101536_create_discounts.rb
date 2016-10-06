class CreateDiscounts < ActiveRecord::Migration[5.0]
  def change
    create_table :discounts do |t|
      t.string :name
      t.integer :percent
      t.text :description
      t.date :startDate
      t.date :endDate

      t.timestamps
    end
  end
end

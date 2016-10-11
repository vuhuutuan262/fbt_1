class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name, unique: true
      t.text :description
      t.attachment :cover

      t.timestamps
    end
  end
end

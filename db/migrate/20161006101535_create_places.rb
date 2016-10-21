class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name
      t.text :description
      t.string :url_image
      t.integer :viewer, default: 0

      t.timestamps
    end
  end
end

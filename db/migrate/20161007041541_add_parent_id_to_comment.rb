class AddParentIdToComment < ActiveRecord::Migration[5.0]
  def change
    add_column :comment, :parent_id, :integer
  end
end

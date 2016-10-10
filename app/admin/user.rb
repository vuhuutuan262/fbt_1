ActiveAdmin.register User do
  filter :name
  filter :created_at
  actions :index, :show, :destroy

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :is_admin
    column :created_at
    actions
  end
end

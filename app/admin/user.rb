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

  controller do
    rescue_from ActiveRecord::RecordNotFound, with: :show_errors

    def show_errors
      flash[:danger] = t "user_resources.not_found"
      redirect_to admin_dashboard_path
    end
  end
end

ActiveAdmin.register Place do
  permit_params :name, :description, :cover

  index do
    column :id
    column :name
    column :decription do |place|
     truncate place.description.html_safe
    end
    actions
  end

  show do
    h3 place.name
    div do
      raw place.description
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :name
      f.input :description, as: :ckeditor
      f.input :cover, required: true, as: :file
    end
    f.actions
    end
end

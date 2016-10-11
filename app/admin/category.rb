ActiveAdmin.register Category do
  permit_params :name, :description, :cover

  index do
    selectable_column
    column :id
    column :name
    column :decription
    actions
  end

  show do
    h3 category.name
    div do
      raw category.description
    end
    div do
      image_tag category.cover
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
